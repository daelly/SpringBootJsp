package sample.tomcat.jsp.dao;

import javax.persistence.EntityManager;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.transaction.annotation.Transactional;

import sample.tomcat.jsp.data.Person;

@RunWith(SpringRunner.class)
@DataJpaTest
@Transactional
public class PersonDaoTest {
	
	@Autowired
	private IPersonDao personDao;
	
	@Autowired
	EntityManager em;
	
	@Test
	public void testPersonDao(){
		Person p = new Person();
		p.setAge(30);
		p.setName("李小宝");
		p.setSex(false);
		personDao.save(p);
		em.clear();
		Person p2 = personDao.findOne(p.getId());
		System.out.println(p2.getName());
	}
}
