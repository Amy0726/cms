

import com.alibaba.fastjson.JSON;
import com.cms.model.Article;
import com.cms.service.ArticleService;
import org.apache.log4j.Logger;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;
import java.util.List;

/**
 * 单元测试类
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath*:/spring-mybatis.xml"})
 public class ArticleTest {
    private static Logger logger = Logger.getLogger(ArticleTest.class);


    @Resource
    private ArticleService articleService;
    @Test
    public void testArticle() {
        List<Article> list  = articleService.getArticleList(3);
        logger.info(JSON.toJSONString(list));
    }
}

