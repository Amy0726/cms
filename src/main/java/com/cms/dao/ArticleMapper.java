package com.cms.dao;

import com.cms.model.Article;

import java.util.List;

public interface ArticleMapper {

    List<Article> getArticleList(Integer id);

    List<Article> getTopArticle(Integer id);

    Article getArticleById(Integer id);

    void insertArticle(Article article);

    void updateArticle(Article article);
}