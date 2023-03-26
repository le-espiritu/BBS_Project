# BBS Project

동일한 게시판 웹 어플리케이션을 MVC model 1, MVC model 2, Spring MVC 등 각기 다른형태의 아키텍쳐로 제작하며 백엔드 개발을 익히고 공부한 프로젝트입니다.



## 기술 스택

|                 백엔드                  |       프론트엔드        |     서버      |         DB         |
| :-------------------------------------: | :---------------------: | :-----------: | :----------------: |
| JAVA 1.8, Spring 4.3,  Maven, JSP, JSTL | HTML5, CSS3, JavaScript | Apache Tomcat | MySQL, Spring JDBC |



## 프로젝트 by 아키텍쳐

 ### MVC model 1 BBS

+ [소스보기](https://github.com/le-espiritu/BBS_Project/tree/main/BBS)
+ 특징
  + 클라이언트의 모든 요청을 JSP가 직접 받고, 모델(DB)에 JSP가 직접 접근.
  + 코드의 양이 적거나 간단한 어플리케이션일 경우 JSP로 요청을 받는 형태가 직관적으로 보일 수도 있음
  + 그러나 View단(JSP)에 view코드(HTML)와 로직의 소스 코드(JAVA)가 혼재되어 있어 가독성이 떨어지며, 이에 따라 유지, 보수 하기가 까다로움.



### MVC model 2 BBS

+ [소스보기](https://github.com/le-espiritu/BBS_Project/tree/main/BBSMVC2)
+ 특징
  + 클라이언트의 요청을 JSP가 아닌 서블릿이 받도록 하여, 뷰와 로직을 분리함.
  + DAO를 활용하여 DB 접근하고, 모델을 가져오는 일련의 비즈니스 로직을 서블릿에서 처리하고, JSP는 뷰의 역할을 담당함.



### Spring MVC BBS

+ [소스보기](https://github.com/le-espiritu/BBS_Project/tree/main/BBSSpring)

+ 특징
  + 스프링 프레임워크를 활용하여 MVC 모델2 구현
  + 서블릿을 모든 요청을 받는 Dispatcher servlet 과 요청에 따른 로직을 구현하는 Controller로 나눔
  + Controller를 다시 프레젠테이션 레이어, 서비스 레이어, 레포지토리 레이어로 나누어 레이어드 아키틱쳐 구현
  + 최대한 Restful하게 코드를 작성하고자 노력하였으며, URI로 자원을 표현하고, 해당 자원에 대한 여러 요청을 HTTP Method로 구현하고자 함.