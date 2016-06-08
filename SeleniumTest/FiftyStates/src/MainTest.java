import java.io.File;
import java.util.concurrent.TimeUnit;

import org.apache.commons.io.FileUtils;
import org.junit.*;
import static org.junit.Assert.*;
import org.openqa.selenium.*;
import org.openqa.selenium.firefox.FirefoxDriver;
import org.openqa.selenium.TakesScreenshot;

public class MainTest {

		public static String baseUrl;
		public static void main(String[] args) throws Exception {
		        // Create a new instance of the Firefox driver
		        // Notice that the remainder of the code relies on the interface, 
		        // not the implementation.
		    FirefoxDriver driver = new FirefoxDriver();
		    baseUrl = "http://192.168.33.11";
		    driver.manage().timeouts().implicitlyWait(30, TimeUnit.SECONDS);
		    driver.get(baseUrl);

		        System.out.println("Page title is: " + driver.getTitle());

		        assertEquals("ALABAMA", driver.findElement(By.cssSelector("td")).getText());
		        assertEquals("AL", driver.findElement(By.xpath("//td[2]")).getText());
		        assertEquals("ALASKA", driver.findElement(By.xpath("//tr[3]/td")).getText());
		        assertEquals("AK", driver.findElement(By.xpath("//tr[3]/td[2]")).getText());
		        assertEquals("ARIZONA", driver.findElement(By.xpath("//tr[4]/td")).getText());
		        assertEquals("AZ", driver.findElement(By.xpath("//tr[4]/td[2]")).getText());
		        assertEquals("WYOMING", driver.findElement(By.xpath("//tr[51]/td")).getText());
		        assertEquals("WY", driver.findElement(By.xpath("//tr[51]/td[2]")).getText());

		        File scrFile = ((TakesScreenshot)driver).getScreenshotAs(OutputType.FILE);
		    	String workingdirectory = System.getProperty("user.dir");
		        System.out.println("Placing screenshot into: "+workingdirectory);
		        FileUtils.copyFile(scrFile,  new File(workingdirectory+"\\screenshot.png"));

		        //Close the browser
		        driver.quit();

		}
}
