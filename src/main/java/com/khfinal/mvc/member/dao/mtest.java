package com.khfinal.mvc.member.dao;

public class mtest {
	public static void main(String[] args) {
		String a = "황재원";
		String[] abc = new String[5];
		
		abc[0] = "황재원";
		abc[1] = "재원황";
		abc[2] = "멍청이";
		abc[3] = "황바보";
		abc[4] = "똥황개";

		for(int i = 0 ; i < 5 ; i++) {
			if(abc[i].charAt(0)=='황') {
				System.out.println("정답" + i + " : "+ abc[i] );
			}
		}
	}
}
