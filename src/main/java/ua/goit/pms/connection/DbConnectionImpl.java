package ua.goit.pms.connection;

import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;
import lombok.SneakyThrows;
import ua.goit.pms.utils.PropertiesReader;
import java.io.Closeable;
import java.sql.Connection;

public class DbConnectionImpl implements DbConnection, Closeable {

    private static Connection connection;
    private HikariDataSource data;

    public DbConnectionImpl(){
        connection = createData();
    }


    private Connection createData(){
        HikariConfig config = new HikariConfig();
        config.setJdbcUrl(PropertiesReader.getProperty("url"));
        config.setDriverClassName(PropertiesReader.getProperty("driver"));
        config.setUsername("root");
        config.setPassword("root");
        config.setMaximumPoolSize(10);
        config.setConnectionTimeout(10000);
        config.setIdleTimeout(10000);
        data = new HikariDataSource(config);
        return connection;
    }

    @Override
    @SneakyThrows
    public Connection getConnection(){
        return data.getConnection();
    }

    @SneakyThrows
    @Override
    public void close(){
        getConnection().close();
    }
}
