package com.telusko.JobApp.service;

import net.sf.jasperreports.engine.*;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;
import org.springframework.core.io.ClassPathResource;
import org.springframework.stereotype.Service;
import java.io.InputStream;
import java.util.List;
import java.util.Map;

@Service
public class JasperReportService {

    public byte[] generateReport(String reportTemplate, List<?> data, Map<String, Object> parameters) throws Exception {
        // Load the Jasper report file
        InputStream reportStream = new ClassPathResource("reports/" + reportTemplate).getInputStream();

        // Compile the JRXML file only if it's not precompiled
        JasperReport jasperReport = JasperCompileManager.compileReport(reportStream);

        // Create DataSource from the list
        JRBeanCollectionDataSource dataSource = new JRBeanCollectionDataSource(data);

        // Fill the report with data and parameters
        JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, parameters, dataSource);

        // Export report to PDF format
        return JasperExportManager.exportReportToPdf(jasperPrint);
    }
}
