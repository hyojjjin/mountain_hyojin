package org.zerock.domain;

import lombok.Data;

@Data
public class MemberVO {
	private	long no;
	private String id;
	private String password;
	private String email;
	private String name;
	private String nickname;
	private String loc;
	private int manager; //관리자
}
