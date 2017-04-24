package com.techelevator.model.jdbc;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.security.crypto.password.StandardPasswordEncoder;
import com.techelevator.model.User;
import com.techelevator.model.UserDAO;

@Component
public class JdbcUserDAO implements UserDAO {
	
	private JdbcTemplate jdbcTemplate;

	@Autowired
	public JdbcUserDAO(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}
	

	
	@Override
	public void save(User user){
		StandardPasswordEncoder encoder = new StandardPasswordEncoder();
		String encodedPassword = encoder.encode(user.getPassword());
		user.setPassword(encodedPassword);
		String userSqlStatement = "INSERT INTO users(username, password,email,firstname,lastname,breweryname,breweryphone, "
				+ "enabled, pending) VALUES(?,?,?,?,?,?,?,?,?)";
		jdbcTemplate.update(userSqlStatement, user.getUsername(), user.getPassword(), 
				user.getEmail(), user.getFirstName(), user.getLastName(), 
				user.getBreweryName(), user.getBreweryPhone(), 
				user.getIsEnabled(), user.getIsPending());
		
		String authoritySqlStatement="INSERT INTO authorities(username,authority) VALUES(?,?)";
		jdbcTemplate.update(authoritySqlStatement, user.getUsername(), "ROLE_USER");
	}
	
	@Override
	public List<User> getAllUsers(){
		List<User> userList = new ArrayList<>();
		String userSqlStatement = "Select * FROM USERS WHERE enabled ='true' AND username != 'testAdmin'";
		SqlRowSet results = jdbcTemplate.queryForRowSet(userSqlStatement);
		while(results.next()){
			User user = mapRowToUser(results);
			userList.add(user);
		}
		return userList;
	}
	
	@Override
	public List<User> getDisabledUsers(){
		List<User> userList = new ArrayList<>();
		String userSqlStatement = "Select * FROM USERS WHERE enabled ='false' AND pending='false' AND username != 'testAdmin'";
		SqlRowSet results = jdbcTemplate.queryForRowSet(userSqlStatement);
		while(results.next()){
			User user = mapRowToUser(results);
			userList.add(user);
		}
		return userList;
	}
	
	@Override
	public List<User> getPendingUsers(){
		List<User> userList = new ArrayList<>();
		String userSqlStatement = "Select * FROM USERS WHERE pending ='true' ";
		SqlRowSet results = jdbcTemplate.queryForRowSet(userSqlStatement);
		while(results.next()){
			User user = mapRowToUser(results);
			userList.add(user);
		}
		return userList;
	}
	
	public User getUserByUserName(String userName){
		User user = null;
		String userSqlStatement = "Select * FROM USERS WHERE username = ?";
		SqlRowSet results = jdbcTemplate.queryForRowSet(userSqlStatement, userName);
		while(results.next()){
		user = mapRowToUser(results);
		}
		return user;
	}
	
	@Override
	public void setIsEnabled(User user){
		String userSqlStatement = "UPDATE users SET enabled = ? where username = ?";
		jdbcTemplate.update(userSqlStatement,user.getIsEnabled(), user.getUsername() );
		 userSqlStatement = "UPDATE users SET pending = ? where username = ?";
		 jdbcTemplate.update(userSqlStatement,user.getIsPending(), user.getUsername() );
	}
	
	public boolean userNameValidation(User user){
		User usercheck = new User();
		String userNameValidation = "SELECT * FROM users where username ILIKE ?";
		SqlRowSet userNameResult = jdbcTemplate.queryForRowSet(userNameValidation, user.getUsername());
		
		while(userNameResult.next()){
			usercheck.setUsername(userNameResult.getString("username"));
		}
			if(usercheck.getUsername() == null){
				return false;
			}else{
				return true;
			}
	}
	
	public boolean userEmailValidation(User user){
		User usercheck = new User();
		String userEmailValidation = "SELECT * FROM users where email LIKE ?";	
		SqlRowSet userEmailResult = jdbcTemplate.queryForRowSet(userEmailValidation, user.getEmail());
		while(userEmailResult.next()){
			usercheck.setUsername(userEmailResult.getString("username"));
		}
			if(usercheck.getUsername() == null){
				return false;
			}else{
				return true;
			}
		
	}
	
private User mapRowToUser(SqlRowSet row) {
		User user = new User();
		user.setUsername(row.getString("username"));
		user.setBreweryName(row.getString("breweryname"));
		user.setIsEnabled(row.getBoolean("enabled"));
		user.setIsPending(row.getBoolean("pending"));
		user.setBreweryPhone(row.getString("breweryphone"));
		user.setFirstName(row.getString("firstname"));
		user.setLastName(row.getString("lastname"));
		user.setEmail(row.getString("email"));
		return user;
	}


	

}
