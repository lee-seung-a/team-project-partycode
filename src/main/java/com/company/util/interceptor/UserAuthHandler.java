package com.company.util.interceptor;


	
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

import com.company.command.UsersVO;

public class UserAuthHandler implements HandlerInterceptor {
  
   @Override
   public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
         throws Exception {
   HttpSession session   =request.getSession();
   
      UsersVO vo =(UsersVO)session.getAttribute("users");
   
      if(vo == null) { 

         response.sendRedirect(request.getContextPath()+"/users/userLogin"); //절대경로
         return false;
      }
   
      
      
      
      
      return true;
   }
   
   
   

}