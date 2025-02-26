package com.telusko.JobApp.controller;

import com.telusko.JobApp.model.JobPost;
import com.telusko.JobApp.service.JobService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
public class JobController {

	@Autowired
	private JobService service;

	// ************************************************************************

	@RequestMapping({"/","/home"})
	public String home() {
		return "home";
	}

	// ************************************************************************

	@RequestMapping("/addjob")
	public String addJob() {
		return "addjob";
	}

//	@PostMapping("/jobPost")
//	public JobPost addJob(@RequestBody JobPost jobPost) {
//		return service.addJob(jobPost);
////		service.addJob(jobPost);
////		return service.addJob(jobPost.getPostId());
//	}
	// ************************************************************************

	// controller method for getting all job posts
	@GetMapping("/viewalljobs")
	public String viewJobs(Model model) {

		List<JobPost> jobPosts = service.returnAllJobPosts();
		model.addAttribute("jobPosts", jobPosts);
		return "viewalljobs";
	}
	@GetMapping("/editJob")
	public String editJob(@RequestParam("postId") Integer postId, Model model) {
		JobPost jobPost = service.getJobById(postId); // Use the service method
		model.addAttribute("jobPost", jobPost);

		return "editJob";  // This should map to editJob.jsp in /WEB-INF/views/
	}

	@PostMapping("/handleForm")
	public String handleAddJobForm(JobPost jobPost,Model model) {
		model.addAttribute("jobPost", jobPost);
		service.addJobPost(jobPost);
		//System.out.println(jobPost);
		  return "success";
		
	}
	@PostMapping("/updateJob")
	public String updateJob(JobPost jobPost) {
		service.updateJob(jobPost);
		return "redirect:/viewalljobs";
	}
	@DeleteMapping("/deleteJob")
	public ResponseEntity<String> deleteJob(@RequestParam("postId") Integer postId){
		try {
			service.deleteJob(postId);
			return  ResponseEntity.ok("Job deleted successfully");
		} catch (Exception e){
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Error deleting job");
		}
	}
	
}
