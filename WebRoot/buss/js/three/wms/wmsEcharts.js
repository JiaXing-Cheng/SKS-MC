function showPieChart() {
	var myChart = echarts.init(document.getElementById('pieChart'));
	option = {
		tooltip : {
			trigger : 'item',
			formatter : "{a} <br/>{b}: {c} ({d}%)"
		},
		legend : {
			orient : 'vertical',
			x : 'left',
			textStyle : {
				color : '#ffffff'
			},
			data : [ 'һ���澯', '�����澯', '�����澯', '�ļ��澯' ]
		},
		grid : {
			x : 0,
			y : 0
		},
		series : [ {
			name : '�澯����',
			type : 'pie',
			radius : [ '50%', '70%' ],
			avoidLabelOverlap : false,
			label : {
				normal : {
					show : false,
					position : 'center'
				},
				emphasis : {
					show : true,
					textStyle : {
						fontSize : '30',
						fontWeight : 'bold'
					}
				}
			},
			labelLine : {
				normal : {
					show : false
				}
			},
			data : [ {
				value : 335,
				name : 'һ���澯'
			}, {
				value : 310,
				name : '�����澯'
			}, {
				value : 234,
				name : '�����澯'
			}, {
				value : 135,
				name : '�ļ��澯'
			} ]
		} ]
	};
	myChart.setOption(option);

}
function showGauge() {
	var myChart = echarts.init(document.getElementById('gauge'));
	option = {
		title : {
			text : '���ܿ�����',
			textStyle : {
				fontSize : 15,
				fontWeight : 'bolder',
				color : '#ffffff' // ������������ɫ
			}
		},
		tooltip : {
			trigger : 'axis'
		},
		legend : {
			data : [ '�澯��Ŀ' ]
		},
		calculable : true,
		xAxis : [ {
			axisLabel : { // �������ı���ǩ�����axis.axisLabel
				show : true,
				textStyle : {
					color : '#ffffff'
				}
			},
			type : 'category',
			data : [ '��һ��', '�ڶ���', '������', '������', '������' ],
			textStyle : {
				color : '#fff'
			}
		} ],
		yAxis : [ {
			axisLabel : { // �������ı���ǩ�����axis.axisLabel
				show : true,
				textStyle : {
					color : '#ffffff'
				}
			},
			type : 'value'
		} ],
		series : [ {
			name : '������',
			type : 'bar',
			itemStyle : {
				normal : {
					color : '#0f7bb7'
				}
			},
			data : [ 12, 4, 7, 23, 16 ],
			markPoint : {
				data : [ {
					type : 'max',
					name : '���ֵ'
				}, {
					type : 'min',
					name : '��Сֵ'
				} ]
			},

		}, ]
	};

	myChart.setOption(option);

}
