package com.bluecloud.component.sys.entity.po;

import javax.persistence.Entity;
import javax.persistence.Table;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

import com.bluecloud.framework.core.mvc.base.domain.LongIdObject;

@Entity
@Table(name = "sys_role_menu")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class SysRoleMenu extends LongIdObject {

	private static final long serialVersionUID = 448856104750959425L;
	private Long roleid;
	private String menuid;
	public Long getRoleid() {
		return this.roleid;
	}
	public String getMenuid() {
		return this.menuid;
	}
	public void setRoleid(Long roleid) {
		this.roleid = roleid;
	}
	public void setMenuid(String menuid) {
		this.menuid = menuid;
	}
	
}