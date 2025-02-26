package com.telusko.JobApp.service;

import com.telusko.JobApp.model.JobPost;
import com.telusko.JobApp.repo.JobRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class JobService {
	@Autowired
	public JobRepo repo;
	
	
	
	//method to return all JobPosts
	public List<JobPost> returnAllJobPosts() {
		return repo.findAll();

		
	}
	public JobPost addJobPost(JobPost jobPost) {
		repo.save(jobPost);

		return jobPost;
	}

	public JobPost getJobById(Integer postId) {
		JobPost jobPost = repo.findById(postId).orElse(null);

		return jobPost;
	}

	public JobPost updateJob(JobPost jobPost) {
		repo.save(jobPost);

		return jobPost;

	}

	public void deleteJob(Integer postID) {
		System.out.println(postID);
		repo.deleteById(postID);
	}
}



