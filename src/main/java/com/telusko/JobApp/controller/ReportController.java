package com.telusko.JobApp.controller;

import com.telusko.JobApp.service.JasperReportService;
import com.telusko.JobApp.service.UserService;
import net.sf.jasperreports.engine.*;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping("/reports")
public class ReportController {

    private final JasperReportService jasperReportService;
    private final UserService userService;

    @Value("${spring.datasource.url}")
    private String dbUrl;

    @Value("${spring.datasource.username}")
    private String dbUsername;

    @Value("${spring.datasource.password}")
    private String dbPassword;

    public ReportController(JasperReportService jasperReportService, UserService userService) {
        this.jasperReportService = jasperReportService;
        this.userService = userService;
    }

    @GetMapping("/generate")
    public ResponseEntity<byte[]> generateReport(@RequestParam(defaultValue = "user.jrxml") String template) {
        try (InputStream jrxmlStream = getClass().getResourceAsStream("/reports/" + template)) {
            if (jrxmlStream == null) {
                return ResponseEntity.badRequest().body(("Report template not found: " + template).getBytes());
            }

            // ✅ Compile .jrxml to .jasper
            JasperReport jasperReport = JasperCompileManager.compileReport(jrxmlStream);

            Map<String, Object> parameters = new HashMap<>();
            parameters.put("ReportTitle", "User Report");

            try (Connection conn = DriverManager.getConnection(dbUrl, dbUsername, dbPassword)) {
                JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, parameters, conn);
                byte[] pdfReport = JasperExportManager.exportReportToPdf(jasperPrint);

                return ResponseEntity.ok()
                        .header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=user_report.pdf")
                        .contentType(MediaType.APPLICATION_PDF)
                        .body(pdfReport);
            }
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.internalServerError().body(("Error generating report: " + e.getMessage()).getBytes());
        }
    }

}
