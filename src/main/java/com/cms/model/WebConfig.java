package com.cms.model;

import org.springframework.stereotype.Component;
@Component
public class WebConfig {
    private String resource;
    private String context;
    private String revision;

    public void setResource(String resource) {
        this.resource = resource;
    }

    public void setContext(String context) {
        this.context = context;
    }

    public void setRevision(String revision) {
        this.revision = revision;
    }

    public String getResource() {

        return resource;
    }

    public String getContext() {
        return context;
    }

    public String getRevision() {
        return revision;
    }
}
