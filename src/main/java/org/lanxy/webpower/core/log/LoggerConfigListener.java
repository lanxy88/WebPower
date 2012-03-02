package org.lanxy.webpower.core.log;

import org.slf4j.bridge.SLF4JBridgeHandler;
import org.springframework.web.util.Log4jConfigListener;

import javax.servlet.ServletContextEvent;
import java.util.logging.Handler;
import java.util.logging.LogManager;
import java.util.logging.Logger;

/**
 * .
 *
 * @author <a href="mailto:lanxy88@gmail.com">wolfe</a>
 * @version V1.0, 12-3-2 下午2:01
 */
public class LoggerConfigListener extends Log4jConfigListener {
    @Override
    public void contextInitialized(ServletContextEvent event) {
        super.contextInitialized(event);
        Logger logger = LogManager.getLogManager().getLogger("");
        for(Handler handler:logger.getHandlers())
        {
            logger.removeHandler(handler);
        }
        logger.addHandler(new SLF4JBridgeHandler());
    }

    @Override
    public void contextDestroyed(ServletContextEvent event) {
        super.contextDestroyed(event);
        SLF4JBridgeHandler.uninstall();
    }
}
