<%@ page import="java.io.*,java.util.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<a href="home.jsp" target="_top" >主页</a>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>商品详情</title>
    </head>
    <body>
        <% if(request.getParameter("id").equals("0")) {%>
        <h1>鲁滨逊漂流记</h1>
        <img src="/WebApplication/images/0.jpg">
        <div id="detail-tag-id-3" name="detail-tag-id-3" text="内容简介" class="book-detail-item" >
        <div class="item-mt">
            <h3>商品介绍</h3>
        </div>
        <div class="item-mc">
            <div class="book-detail-content"><p>   《鲁滨逊漂流记》每个人的一生都不会是一帆风顺的，总会遇到一些意外与困难。当意外与困难来临时，应该学会接受和面对，用一颗积极乐观的心，去看待世界，对世界和明天抱有美丽的渴望、期待与信念。就像主人公鲁滨逊一样，他流落荒岛，在一次次坎坷曲折的磨难中，勇敢无畏、机警果断、自立自救、坚韧不拔，展现着男子汉的阳刚。翻开书卷，感受那跳动的脉搏和生命的火焰。</p></div>
        </div>

        </div>
        <% }%>
        <%if(request.getParameter("id").equals("1")) {%>
        <h1>茶花女</h1>
        <img src="/WebApplication/images/1.jpg">
        <div id="detail-tag-id-3" name="detail-tag-id-3" text="内容简介" class="book-detail-item" >
        <div class="item-mt">
            <h3>商品介绍</h3>
        </div>
        <div class="item-mc">
            <div class="book-detail-content"><p>《茶花女》是首部翻译成中文的西方小说名著，1897年就有林纾等人翻译的文言文版《巴黎茶花女遗事》问世。此后几十年，《茶花女》在中国畅销不衰。小说的情节其实并不复杂。青年阿尔芒爱上了巴黎社交圈的高级妓女玛格丽特。玛格丽特乡下贫民出生，年纪轻轻就来到巴黎。她患有肺病，并由此认识了一位老公爵，公爵因为玛格丽特长相酷似自己死去的女儿，因此负担了玛格丽特的一大部分开销。阿尔芒费尽周折终于和玛格丽特在一起，两人之间有一段愉快的乡村同居生活。但是阿尔芒的收入不足以维持两人的生活，玛格丽特还得求助于老公爵，然而最后为了爱情，玛格丽特还是放弃了公爵的资助，典当自己的家产，苦苦支撑。阿尔芒打算把自己的年金收入转让给玛格丽特，这激怒了他的父亲，他父亲为了自己即将出嫁的女儿，为了家族的名誉，勒令玛格丽特必须和阿尔芒分手，玛格丽特为了不伤害阿尔芒的家人，答应了这个请求，两人分手。分手后，阿尔芒难以忘情，用尽各种手段羞辱玛格丽特，不久，玛格丽特病逝，知道真相的阿尔芒悲痛欲绝。
　　正如著名学者袁行霈评价《茶花女》时所言：是什么感动我呢？主要是这个处于社会底层的女子所受到的不公正的待遇。作为一名妓女，茶花女玛格丽特，并不是放荡无情麻木不堪供人戏弄的玩物，她纯洁、多情，活泼有生气，敢爱敢恨，富有奉献精神，最后为了爱人，放弃自己的全部。写爱情，写悲剧的小说很多，但像《茶花女》这样，简单、真诚、打动人心的作品，屈指可数，也正因为这份真诚的爱与痛，才让本书能历经岁月淘洗，成为经典名著。
       </p></div>
        </div>
        
        </div>
        <% }%>
         <%if(request.getParameter("id").equals("2")) {%>
        <h1>java实用手册</h1>
        <img src="/WebApplication/images/2.jpg">
        <div id="detail-tag-id-3" name="detail-tag-id-3" text="内容简介" class="book-detail-item" >
        <div class="item-mt">
            <h3>商品介绍</h3>
        </div>
        <div class="item-mc">
            <div class="book-detail-content"><p>学习Java必备好书！</p></div>
        </div>
        
        </div>
        <% }%>
        <%if(request.getParameter("id").equals("3")) {%>
        <h1>java script</h1>
        <img src="/WebApplication/images/3.jpg">
        <div id="detail-tag-id-3" name="detail-tag-id-3" text="内容简介" class="book-detail-item" >
        <div class="item-mt">
            <h3>商品介绍</h3>
        </div>
        <div class="item-mc">
            <div class="book-detail-content"><p>  学习Javascript必备工具书！</p></div>
        </div>   
        </div>
        <% }%>
        <%if(request.getParameter("id").equals("4")) {%>
        <h1>c#</h1>
        <img src="/WebApplication/images/4.jpg">
        <div id="detail-tag-id-3" name="detail-tag-id-3" text="内容简介" class="book-detail-item" >
        <div class="item-mt">
            <h3>商品介绍</h3>
        </div>
        <div class="item-mc">
            <div class="book-detail-content"><p>  让你爱上c#编程!</p></div>
        </div>
        </div>
        <% }%>
        <td align="center" colspan="3"><a href="DoCart.jsp?action=buy&id=<%=request.getParameter("id")%>">加入购物车</a></td>
    </body>
</html>
