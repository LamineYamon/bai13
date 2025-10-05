package murach.data;

import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public class DBUtil {
    private static EntityManagerFactory emf;
    
    static {
        try {
            System.out.println("Initializing EntityManagerFactory...");
            emf = Persistence.createEntityManagerFactory("emailListPU");
            System.out.println("EntityManagerFactory initialized successfully.");
        } catch (Exception e) {
            System.err.println("Error initializing EntityManagerFactory: " + e.getMessage());
            e.printStackTrace();
            throw new ExceptionInInitializerError(e);
        }
    }
    
    public static EntityManagerFactory getEmFactory() {
        if (emf == null) {
            throw new IllegalStateException("EntityManagerFactory has not been initialized");
        }
        return emf;
    }
    
    public static void closeEmFactory() {
        if (emf != null && emf.isOpen()) {
            emf.close();
        }
    }
}