package lmx.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "userinfo")
public class UserLogin {
	@Id
	@Column(name = "userid")
	private long userid;
	@Column(name = "phone", length = 11)
	private String phone;
	@Column(name = "password", length = 32)
	private String password;
	@Column(name = "salt", length = 10)
	private String salt;
	@Column(name = "email", length = 50)
	private String email;
	@Column(name = "competence", length = 10)
	private String competence;

	public long getUserid() {
		return userid;
	}

	public String getPhone() {
		return phone;
	}

	public String getPassword() {
		return password;
	}

	public String getSalt() {
		return salt;
	}

	public String getEmail() {
		return email;
	}

	public String getCompetence() {
		return competence;
	}
}
