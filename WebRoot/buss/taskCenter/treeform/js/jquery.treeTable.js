
(function ($) {
	
	var path = _GLO_ROOTPATH+'buss/taskCenter/treeform/treeTable/';
    $.fn.treeTable = function (opts) {
        opts = $.extend({
            theme: 'default',
            expandLevel: 2, /* 树形展开的级别 */
            column: 2, /* 第几列元素  点击展开*/
            onSelect: function($treeTable, id){},
            beforeExpand: function($treeTable, id){}
        }, opts);

        var $treeTable = this;
        $treeTable.addClass('tree_table');
        if ($('head').find('#tree_table_' + opts.theme).length == 0) {
            $('head').append('<link id="tree_table_' + opts.theme + '" href="' + path + opts.theme + '/jquery.treeTable.css" rel="stylesheet" type="text/css" />');
        }

        var css = {
            'N' : opts.theme + '_node',
            'AN' : opts.theme + '_active_node',
            'O' : opts.theme + '_open',
            'LO' : opts.theme + '_last_open',
            'S' : opts.theme + '_shut',
            'LS' : opts.theme + '_last_shut',
            'HO' : opts.theme + '_hover_open',
            'HS' : opts.theme + '_hover_shut',
            'HLO' : opts.theme + '_hover_last_open',
            'HLS' : opts.theme + '_hover_last_shut',
            'L' : opts.theme + '_leaf',
            'LL' : opts.theme + '_last_leaf',
            'B' : opts.theme + '_blank',
            'V' : opts.theme + '_vertline'
        };

        var pMap = {}, cMap = {};
        var $trs = $treeTable.find('tr');
        initRelation($trs, true);    

        $treeTable.click(function (event) {
            var $target = $(event.target);

            if ($target.attr('controller')) {
                $target = $target.parents('tr[haschild]').find('[arrow]');
  
				if ($target.attr('class').indexOf(css['AN']) == -1 && $target.attr('class').indexOf(css['N']) == -1) { return; }
                var id = $target.parents('tr[haschild]')[0].id;
                if (opts.onSelect && opts.onSelect($treeTable, id) === false) { return; }
            }

            if ($target.attr('arrow')) {
                var className = $target.attr('class');
                if (className == css['AN'] + ' ' + css['HLO'] || className == css['AN'] + ' ' + css['HO']) {
                    var id = $target.parents('tr[haschild]')[0].id;
                    $target.attr('class', css['AN'] + " " + (className.indexOf(css['HO']) != -1 ?  css['HS'] : css['HLS']));
                    shut(id);
					return;
                } else if (className == css['AN'] + ' ' + css['HLS'] || className == css['AN'] + ' ' + css['HS']) {
                    var id = $target.parents('tr')[0].id;
                    $target.attr('class', css['AN'] + " " + (className.indexOf(css['HS']) != -1 ? css['HO'] : css['HLO']));
                    
                    opts.beforeExpand($treeTable, id);
                    open(id);
					return;
                }
            }
        });
		
		$treeTable.mouseover(hoverActiveNode).mouseout(hoverActiveNode);

        function hoverActiveNode(event) {
            var $target = $(event.target);

            if ($target.attr('controller')) {
                $target = $target.parents('tr[haschild]').find('[arrow]');
            }

            if ($target.attr('arrow')) { 
                var className = $target.attr('class');
                if (className && !className.indexOf(css['AN'])) {
                    var len = opts.theme.length + 1;
                    className = className.split(' ')[1].substr(len);
                    if (className.indexOf('hover_') === 0) {
                        className = opts.theme + '_' + className.substr(6);
                    } else {
                        className = opts.theme + '_hover_' + className;
                    }
                    
                    $target.attr('class', css['AN'] + ' ' + className);
                    return;
                }
            } 
        }
        
        function initRelation($trs, hideLevel) {
            $trs.each(function (i) {
                var pId = $(this).attr('pId') || 0;
                pMap[pId] || (pMap[pId] = []);
                pMap[pId].push(this.id);
                cMap[this.id] = pId;
                
                $(this).addClass(pId);
            }).find('[controller]').css('cursor', 'pointer');

            $trs.each(function (i) {
                if (!this.id) { return; }
                var $tr = $(this);
                
                pMap[this.id] && $tr.attr('hasChild', true);
                var pArr = pMap[cMap[this.id]];
                if (pArr[0] == this.id) {
                    $tr.attr('isFirstOne', true);
                } else {
                    var prevId = 0;
                    for (var i = 0; i < pArr.length; i++) {
                        if (pArr[i] == this.id) { break; }
                        prevId = pArr[i];
                    }
                    $tr.attr('prevId', prevId);
                }

                pArr[pArr.length - 1] == this.id && $tr.attr('isLastOne', true);

                var depth = getDepth(this.id);
                $tr.attr('depth', depth);

				formatNode(this);

                if (hideLevel) {
                    depth > opts.expandLevel && $tr.hide();
                    if ($tr.attr('hasChild') && $tr.attr('depth') < opts.expandLevel) {
                        var className = $tr.attr('isLastOne') ? css['LO'] : css['O'];
                        $tr.find('.' + css['AN']).attr('class', css['AN'] + ' ' + className);
                    }
                }               
            });
            
            function getDepth(id) {
                if (cMap[id] == 0) { return 1; } 
                var $parentDepth = getDepth(cMap[id]);
                return $parentDepth + 1; 
            }
        }

        function shut(id) {
            if (!pMap[id]) { return false; }
            for (var i = 0; i < pMap[id].length; i++) {
                shut(pMap[id][i]);
            }
            $('tr.' + id, $treeTable).hide();
        }

        function open(id) {
            $('tr.' + id, $treeTable).show();
            if (!pMap[id]) { return false; }
            for (var i = 0; i < pMap[id].length; i++) {
                var cId = pMap[id][i];
                if (pMap[cId]) {
                    var className = $('#' + cId, $treeTable).find('.' + css['AN']).attr('class');
                    (className == css['AN'] + ' ' + css['O'] || className == css['AN'] + ' ' + css['LO']) && open(cId);
                }
            }
        }

        function formatNode(tr) {
            var $cur = $(tr);
            var id = tr.id;

            if (cMap[id] == 0) {
                var $preSpan = $('<span class="prev_span"></span>');
            } else {
                if (!$cur.attr('isFirstOne')) {
                    var $preSpan = $('#' + $cur.attr('prevId'), $treeTable).children("td").eq(opts.column).find('.prev_span').clone();
                } else {
                    var $parent = $('#' + cMap[id], $treeTable);
                    var $preSpan = $parent.children("td").eq(opts.column).find('.prev_span').clone();

                    if ($parent.attr('isLastOne')) {
                        $preSpan.append('<span class="' + css['N'] + ' ' + css['B'] + '"></span>');
                    } else {
                        $preSpan.append('<span class="' + css['N'] + ' ' + css['V'] + '"></span>');
                    }
                }
            }

            if ($cur.attr('hasChild')) {
                var className = $cur.attr('isLastOne') ? css['LS'] : css['S'];
                className = css['AN'] + ' ' + className;
            } else {
                var className = css['N'] + ' ' + ($cur.attr('isLastOne') ? css['LL'] : css['L']);
            }
            
            var $td = $cur.children("td").eq(opts.column);
            $td.prepend('<span arrow="true" class="' + className + '"></span>').prepend($preSpan);
        };
        
        $treeTable.addChilds = function(trsHtml) {
            var $trs = $(trsHtml);
            if (!$trs.length) { return false; }
            
            var pId = $($trs[0]).attr('pId');
            if (!pId) { return false; }
            
            var insertId = pMap[pId] && pMap[pId][pMap[pId].length - 1] || pId;
            $('#' + insertId, $treeTable).after($trs);
            initRelation($trs);
        };

        return $treeTable;
    };
})(jQuery);

