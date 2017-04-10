package com.cms.util;

import com.cms.model.WebConfig;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationListener;
import org.springframework.context.event.ContextRefreshedEvent;
import org.springframework.web.context.WebApplicationContext;

import javax.servlet.ServletContext;

/**
 * Created by ykz on 2017/4/5.
 */
public class SpringStart implements ApplicationListener<ContextRefreshedEvent> {

    private Logger logger = LogManager.getLogger(SpringStart.class);

    private WebConfig webConfig = new WebConfig();

    public void setWebConfig(WebConfig webConfig) {
        this.webConfig = webConfig;
    }

    public WebConfig getWebConfig() {

        return webConfig;
    }

    /**
     * ContextRefreshedEvent为初始化完毕事件，spring还有很多事件可以利用
     */
    public void onApplicationEvent(ContextRefreshedEvent event) {
        ApplicationContext applicationContext = event.getApplicationContext();
        WebApplicationContext webApplicationContext = (WebApplicationContext)applicationContext;
        ServletContext servletContext = webApplicationContext.getServletContext();
        webConfig.setContext(servletContext.getContextPath());
        webConfig.setResource(webConfig.getContext()+"/public");
        servletContext.setAttribute("context",webConfig.getContext());
        servletContext.setAttribute("resource",webConfig.getResource());
        servletContext.setAttribute("revision",webConfig.getRevision());
      }
}
