package com.miempresa.listeners; // Ajusta el paquete según tu estructura

import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;
import jakarta.servlet.annotation.WebListener;
import java.lang.reflect.Method;

@WebListener
public class MyAppContextListener implements ServletContextListener {
    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        try {
            Class<?> clazz = Class.forName("com.mysql.cj.jdbc.AbandonedConnectionCleanupThread");
            Method method = clazz.getMethod("shutdown");
            method.invoke(null);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        // Código de inicialización si es necesario
    }
}