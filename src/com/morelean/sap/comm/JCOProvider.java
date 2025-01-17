package com.morelean.sap.comm;

import com.sap.conn.jco.ext.*;
import java.util.HashMap;
import java.util.Properties;

public class JCOProvider implements DestinationDataProvider, SessionReferenceProvider {

    private HashMap<String, Properties> secureDBStorage = new HashMap<String, Properties>();
    private DestinationDataEventListener eL;

    @Override
    public Properties getDestinationProperties(String destinationName) {
        try {
            //read the destination from DB
            Properties p = secureDBStorage.get(destinationName);
            if (p != null) {
                //check if all is correct, for example
                if (p.isEmpty()) {
                    System.out.println("destination configuration is incorrect!");
                }
                return p;
            }
            System.out.println("properties is null ...");
            return null;
        } catch (RuntimeException re) {
            System.out.println("internal error!");
            return null;
        }
    }

    @Override
    public void setDestinationDataEventListener(
            DestinationDataEventListener eventListener) {
        this.eL = eventListener;
        System.out.println("eventListener assigned ! ");
    }

    @Override
    public boolean supportsEvents() {
        return true;
    }

    public void changePropertiesForABAP_AS(String destName, Properties properties) {
        synchronized (secureDBStorage) {
            if (properties == null) {
                if (secureDBStorage.remove(destName) != null) {
                    eL.deleted(destName);
                }
            } else {
                secureDBStorage.put(destName, properties);
                eL.updated(destName); // create or updated
            }
        }
    }

    @Override
    public JCoSessionReference getCurrentSessionReference(String scopeType) {

        RfcSessionReference sesRef = JcoMutiThread.localSessionReference.get();
        if (sesRef != null) {
            return sesRef;
        }
        throw new RuntimeException("Unknown thread:" + Thread.currentThread().getId());
    }

    @Override
    public boolean isSessionAlive(String sessionId) {
        return false;
    }

    @Override
    public void jcoServerSessionContinued(String sessionID)
            throws SessionException {
    }

    @Override
    public void jcoServerSessionFinished(String sessionID) {

    }

    @Override
    public void jcoServerSessionPassivated(String sessionID)
            throws SessionException {
    }

    @Override
    public JCoSessionReference jcoServerSessionStarted() throws SessionException {
        return null;
    }
}