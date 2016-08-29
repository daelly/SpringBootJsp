package sample.tomcat.jsp.data;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

@Entity
@Table(name="tbl_person")
public class Person {
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private Long id;

	@NotNull
	private String name;
	
	private Integer age;
	
	private Boolean sex;

	public Person(){}
	
	public Person(Long id) {
		super();
		this.id = id;
	}

	public Person(String name, Integer age, Boolean sex) {
		super();
		this.name = name;
		this.age = age;
		this.sex = sex;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getAge() {
		return age;
	}

	public void setAge(Integer age) {
		this.age = age;
	}

	public Boolean getSex() {
		return sex;
	}

	public void setSex(Boolean sex) {
		this.sex = sex;
	}
	
}
