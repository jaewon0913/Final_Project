package com.khfinal.mvc.common.aop;

import org.aspectj.lang.JoinPoint;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class LogAop {
	
	public void before(JoinPoint join) {
		Logger logger = LoggerFactory.getLogger(join.getTarget()+ "");
		
		logger.info("------------logger Start------------");
		Object args[] = join.getArgs();
		
		if(args!= null) {
			logger.info("Method : \t" + join.getSignature().getName());
			
			for(int i = 0 ; i < args.length; i++) {
				logger.info(i + " 번째 : \t" + args[i]);
			}
		}
	}
	/*
	 *  join.getTarget() : 대상 객체
	 *      .getArgs() : 대상 파라미터(아규먼트)
	 *      .getSignature() : 대상 메소드 정보
	 */
	
	public void after(JoinPoint join) {
		Logger logger = LoggerFactory.getLogger(join.getTarget()+ "");

		logger.info("------------logger End------------");
	}
	
	public void afterThrowing(JoinPoint join) {
		Logger logger = LoggerFactory.getLogger(join.getTarget()+ "");
		logger.info("------------logger Error------------");
		logger.info("Error : \t " + join.getArgs());
		logger.info("Error : \t " + join.toString());
		

	}
}
