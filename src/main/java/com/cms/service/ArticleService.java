package com.cms.service;


import com.cms.model.Article;

import java.util.List;

public interface ArticleService {

    List<Article> getArticleList(Integer id);

    Article getArticleById(Integer id);

    void saveArticle(Article article);

}
