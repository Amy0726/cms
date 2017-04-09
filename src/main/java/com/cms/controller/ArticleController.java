package com.cms.controller;

import com.alibaba.fastjson.JSON;
import com.cms.dao.ArticleMapper;
import com.cms.model.Article;
import com.cms.service.ArticleService;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Controller
@RequestMapping("/")
public class ArticleController {


    @Resource
    private ArticleService articleService;
   //文章列表
    @RequestMapping("/")
    public String showHome(HttpServletRequest request, Model model) {
        List<Article> list;
        list=articleService.getArticleList(0);
        model.addAttribute("list",list);
        return "articleList";
    }
    //ajax文章列表
    @RequestMapping("/get")
    @ResponseBody
    public List<Article> getArticleList(@RequestParam(value="id",required=true)String id) {
        List<Article> list;
        list=articleService.getArticleList(Integer.parseInt(id));
        return list;
    }
   //文章详情
    @RequestMapping("/articleInfo")
    public String getArticleById(@RequestParam(value="id",required=true)Integer id,Model model) {
        Article article=articleService.getArticleById(id);
        model.addAttribute("article",article);
        return "articleInfo";
    }
    //编辑页面
    @RequestMapping("/editArticle")
    public String editArticle(@RequestParam(value="id",required=true)Integer id,Model model) {
        Article  article=articleService.getArticleById(id);
        model.addAttribute("article",article);
        return "editArticle";
    }
    //跳到添加页面转到和编辑同一页面
    @RequestMapping("/addArticle")
    public String addArticle(Model model) {
        return "editArticle";
    }
    //后台得到列表
    @RequestMapping("/editArticleList")
    public String editArticleList(Model model) {
        List<Article> list;
        list=articleService.getArticleList(0);
        model.addAttribute("list",list);
        return "backArticleList";
    }

    @RequestMapping("/saveArticle")
    public String saveArticle(@RequestParam(value = "img", required = false) MultipartFile img,
                              @RequestParam(value="id",required=true)Integer id ,
                              @RequestParam(value="title",required=true)String title,
                              @RequestParam(value="content",required=true)String content,
                              Model model,
                              HttpServletRequest request) {
        String trueFileName=null;
        if(img!=null) {
            String path=null;
            String type=null;
            String fileName=img.getOriginalFilename();
            System.out.println("上传的文件原名称:"+fileName);
            type=fileName.indexOf(".")!=-1?fileName.substring(fileName.lastIndexOf(".")+1, fileName.length()):null;
            if ("GIF".equals(type.toUpperCase())||"PNG".equals(type.toUpperCase())||"JPG".equals(type.toUpperCase())) {
                String realPath=request.getSession().getServletContext().getRealPath("/")+"img/";
                trueFileName=String.valueOf(System.currentTimeMillis())+fileName;
                path=realPath+trueFileName;
                try {
                    img.transferTo(new File(path));
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }

        }
        Article article=new Article();
        article.setId(id);
        article.setImg(trueFileName);
        article.setTitle(title);
        article.setContent(content);
        articleService.saveArticle(article);
        List<Article> list;
        list=articleService.getArticleList(0);
        model.addAttribute("list",list);
        return "backArticleList";
    }


}
