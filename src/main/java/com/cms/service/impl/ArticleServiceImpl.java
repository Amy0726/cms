package com.cms.service.impl;


import com.cms.dao.ArticleMapper;
import com.cms.model.Article;
import com.cms.service.ArticleService;
import com.mysql.fabric.xmlrpc.base.Data;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;
@Service("ArticleService")
public class ArticleServiceImpl implements ArticleService {

    @Resource
    private ArticleMapper articleDAO;
    public List<Article> getArticleList(Integer id) {
        List<Article> articleList;
        articleList=(id==0?articleDAO.getTopArticle(4):articleDAO.getArticleList(id));
        return articleList;
    }
    public Article getArticleById(Integer id){
        Article article;
        article=articleDAO.getArticleById(id);
        return article;
    }

    public void saveArticle(Article article) {
       Integer id= article.getId();
       if(id==null) {
           article.setInputtime(new Date());
           articleDAO.insertArticle(article);
       }
       else {
           articleDAO.updateArticle(article);
       }

    }


}
