package ua.goit.pms;

import ua.goit.pms.connection.DbConnectionImpl;

import java.sql.Connection;

public class Main {

    public static void main(String[] args){
        DbConnectionImpl connection = new DbConnectionImpl();
        Connection connected = connection.getConnection();
    }

}
