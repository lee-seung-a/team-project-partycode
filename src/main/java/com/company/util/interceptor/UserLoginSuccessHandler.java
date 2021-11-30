package com.company.util.interceptor;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.company.command.UsersVO;

public class UserLoginSuccessHandler implements HandlerInterceptor {
 
   @Override
   public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
         ModelAndView modelAndView) throws Exception {
                

      
       
        ModelMap mv=modelAndView.getModelMap();
      UsersVO users = (UsersVO)mv.get("users"); //컨트롤러에서 넘겨받은 유저객체
        
      if(users != null) {
          HttpSession session=  request.getSession();
         session.setAttribute("users", users);
         System.out.println(users.toString());
         
         
         response.sendRedirect(request.getContextPath()+"/partyboard/party_board");
               
      }
   }
   
   
   

}