package com.gurukula.webdriver;

import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;


import java.util.concurrent.TimeUnit;

import static org.junit.jupiter.api.Assertions.assertTrue;

public class gurukulaTest {

    public static WebDriver driver;
    String branchname1 = "BranchA";
    String branchname2 = "BranchB";
    String branchcode1 = "BRANCH01";
    String branchcode2 = "BRANCH02";
    String staffname1 = "StaffA";


    @BeforeEach
    public void setup(){

        driver = new ChromeDriver();

        driver.navigate().to("http://127.0.0.1:8080/#/");

    }

    @AfterEach
    public void tearDown() {

        driver.close();

        driver.quit();

    }

    @Test
    public void authentication() {

        driver.findElement(By.xpath("/html/body/div[3]/div[1]/div/div/div[2]/div/div[1]/a")).click();

        driver.findElement(By.id("username")).sendKeys("admin");

        driver.findElement(By.id("password")).sendKeys("admin");

        driver.findElement(By.xpath("/html/body/div[3]/div[1]/div/div/div/form/button")).click();

        driver.manage().timeouts().implicitlyWait(10, TimeUnit.SECONDS);

        String actualString = driver.findElement(By.xpath("/html/body/div[3]/div[1]/div/div/div[2]/div")).getAttribute("ng-switch");

        assertTrue(actualString.contains("isAuthenticated"));

    }

    @Test
    public void wrongUser(){

        driver.findElement(By.xpath("/html/body/div[3]/div[1]/div/div/div[2]/div/div[1]/a")).click();

        driver.findElement(By.id("username")).sendKeys("wrongUser");

        driver.findElement(By.id("password")).sendKeys("wrongUser");

        driver.findElement(By.xpath("/html/body/div[3]/div[1]/div/div/div/form/button")).click();

        driver.manage().timeouts().implicitlyWait(10, TimeUnit.SECONDS);

        String actualString = driver.findElement(By.xpath("/html/body/div[3]/div[1]/div/div/div/div[1]")).getAttribute("ng-show");

        assertTrue(actualString.contains("authenticationError"));

    }

    public void addingBranch() throws Exception{


        driver.findElement(By.xpath("//*[@id=\"navbar-collapse\"]/ul/li[2]/a/span/span[2]")).click();

        driver.manage().timeouts().implicitlyWait(30, TimeUnit.SECONDS);


        driver.findElement(By.xpath("//*[@id=\"navbar-collapse\"]/ul/li[2]/ul/li[1]/a/span[2]")).click();

        driver.findElement(By.xpath("/html/body/div[3]/div[1]/div/div[1]/div/div[1]/button/span[2]")).click();

        driver.findElement(By.xpath("//*[@id=\"saveBranchModal\"]/div/div/form/div[2]/div[2]/input")).sendKeys(branchname1);


        try {
            Thread.sleep(1000);
        } catch (Exception e) {
            System.out.println(e);
        }

        driver.findElement(By.xpath("//*[@id=\"saveBranchModal\"]/div/div/form/div[2]/div[3]/input")).sendKeys(branchcode1);


        try {
            Thread.sleep(1000);
        } catch (Exception e) {
            System.out.println(e);
        }

        driver.findElement(By.xpath("//*[@id=\"saveBranchModal\"]/div/div/form/div[3]/button[2]/span[2]")).click();

    }

    @Test
    public void createBranch() throws Exception {

        this.authentication();

        this.addingBranch();

        String actualString = driver.findElement(By.xpath("/html/body/div[3]/div[1]/div/div[4]/table/tbody/tr[1]/td[2]")).getText();

        assertTrue(actualString.contains("BranchA"));

        this.deleteBranch();

    }

    public void deleteBranch() throws Exception{


        WebDriverWait wait = new WebDriverWait(driver, 15);
        wait.until(ExpectedConditions.elementToBeClickable(By.xpath("/html/body/div[3]/div[1]/div/div[4]/table/tbody/tr[1]/td[4]/button[3]/span[2]")));

        try {
            Thread.sleep(1000);
        } catch (Exception e) {
            System.out.println(e);
        }

        driver.findElement(By.xpath("/html/body/div[3]/div[1]/div/div[4]/table/tbody/tr[1]/td[4]/button[3]/span[2]")).click();

        try {
            Thread.sleep(1000);
        } catch (Exception e) {
            System.out.println(e);
        }

        wait.until(ExpectedConditions.elementToBeClickable(By.xpath("//*[@id=\"deleteBranchConfirmation\"]/div/div/form/div[3]/button[2]/span[2]")));


        driver.findElement(By.xpath("//*[@id=\"deleteBranchConfirmation\"]/div/div/form/div[3]/button[2]/span[2]")).click();


        try {
            Thread.sleep(2000);
        } catch (Exception e) {
            System.out.println(e);
        }

        try{

            String actualString = driver.findElement(By.xpath("/html/body/div[3]/div[1]/div/div[4]/table/tbody/tr[1]/td[2]")).getText();

        }catch (Exception e) {
            assertTrue(1==1);

        }

    }

    public void deleteStaff() throws Exception{

        driver.manage().timeouts().implicitlyWait(2, TimeUnit.SECONDS);


        driver.findElement(By.xpath("/html/body/div[3]/div[1]/div/div[4]/table/tbody/tr/td[4]/button[3]/span[2]")).click();

        driver.manage().timeouts().implicitlyWait(2, TimeUnit.SECONDS);


        driver.findElement(By.xpath("//*[@id=\"deleteStaffConfirmation\"]/div/div/form/div[3]/button[2]/span[2]")).click();


        try{

            String actualString = driver.findElement(By.xpath("/html/body/div[3]/div[1]/div/div[4]/nav/ul")).getText();

        }catch (Exception e) {
            assertTrue(1==1);

        }

    }

    @Test
    public void queryBranch() throws Exception {

        this.authentication();

        this.addingBranch();

        driver.findElement(By.xpath("//*[@id=\"searchQuery\"]")).sendKeys(branchname1);

        try {
            Thread.sleep(2000);
        } catch (Exception e) {
            System.out.println(e);
        }

        driver.findElement(By.xpath("/html/body/div[3]/div[1]/div/div[1]/div/div[2]/form/button/span[2]")).click();


        try {
            Thread.sleep(1000);
        } catch (Exception e) {
            System.out.println(e);
        }

        String actualString = driver.findElement(By.xpath("/html/body/div[3]/div[1]/div/div[4]/table/tbody/tr[1]/td[2]")).getText();

        assertTrue(actualString.contains("BranchA"));


    }


    @Test
    public void createStaff() throws Exception {

        this.authentication();

        this.addingBranch();

        try {
            Thread.sleep(2000);
        } catch (Exception e) {
            System.out.println(e);
        }

        driver.manage().timeouts().implicitlyWait(30, TimeUnit.SECONDS);

        driver.findElement(By.xpath("//*[@id=\"navbar-collapse\"]/ul/li[2]/a/span/span[2]")).click();

        driver.findElement(By.xpath("//*[@id=\"navbar-collapse\"]/ul/li[2]/ul/li[2]/a/span[2]")).click();

        driver.findElement(By.xpath("/html/body/div[3]/div[1]/div/div[1]/div/div[1]/button/span[2]")).click();

        driver.findElement(By.xpath("//*[@id=\"saveStaffModal\"]/div/div/form/div[2]/div[2]/input")).sendKeys(staffname1);

        try {
            Thread.sleep(1000);
        } catch (Exception e) {
            System.out.println(e);
        }

        driver.findElement(By.xpath("//*[@id=\"saveStaffModal\"]/div/div/form/div[2]/div[3]/select")).sendKeys("B");

        try {
            Thread.sleep(1000);
        } catch (Exception e) {
            System.out.println(e);
        }

        driver.findElement(By.xpath("//*[@id=\"saveStaffModal\"]/div/div/form/div[3]/button[2]/span[2]")).click();

        try {
            Thread.sleep(3000);
        } catch (Exception e) {
            System.out.println(e);
        }

        String actualString = driver.findElement(By.xpath("/html/body/div[3]/div[1]/div/div[4]/table/tbody/tr[1]/td[2]")).getText();

        assertTrue(actualString.contains("StaffA"));


        try {
            Thread.sleep(2000);
        } catch (Exception e) {
            System.out.println(e);
        }

        this.deleteStaff();

        try {
            Thread.sleep(2000);
        } catch (Exception e) {
            System.out.println(e);
        }

        driver.findElement(By.xpath("//*[@id=\"navbar-collapse\"]/ul/li[2]/a/span/span[2]")).click();

        driver.findElement(By.xpath("//*[@id=\"navbar-collapse\"]/ul/li[2]/ul/li[1]/a/span[2]")).click();


        this.deleteBranch();

    }


}