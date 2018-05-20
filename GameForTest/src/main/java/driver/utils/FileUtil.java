package driver.utils;

import driver.utils.UtilException;
import org.junit.Assert;
import org.openqa.selenium.*;

import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import java.io.*;
import java.nio.file.Files;

public final class FileUtil {
    private FileUtil() {
    }

    public static void createFile(String fileName) {
        try {
            PrintWriter writer = new PrintWriter(fileName, "UTF-8");
            writer.close();
        } catch (IOException e) {
            throw new UtilException("Can not create file '" + fileName + "'\n" + e);
        }
    }

    public static void saveInputStreamToFile(String fileName, InputStream stream) {
        File targetFile = new File(fileName);
        OutputStream outputStream;
        try {
            outputStream = new FileOutputStream(targetFile);
            int read;
            byte[] bytes = new byte[1024];

            while ((read = stream.read(bytes)) != -1) {
                outputStream.write(bytes, 0, read);
            }
            outputStream.close();
        } catch (IOException e) {
            throw new UtilException(e);
        }
    }

    @SuppressWarnings("unused")
    public static void equalsFiles(File expected, File actual) {
        try {
            byte[] act = Files.readAllBytes(actual.toPath());
            byte[] exp = Files.readAllBytes(expected.toPath());
            Assert.assertArrayEquals(exp, act);
        } catch (IOException e) {
            throw new UtilException(e);
        }
    }

    public static void equalsFiles(File expected, File actual, @SuppressWarnings("SameParameterValue") double delta) {
        try {
            byte[] act = Files.readAllBytes(actual.toPath());
            byte[] exp = Files.readAllBytes(expected.toPath());
            Assert.assertEquals("Unexpected size of file ", exp.length, act.length, exp.length * (1 + delta));
        } catch (IOException e) {
            throw new UtilException(e);
        }
    }

    public static File captureElementBitmap(WebDriver driver, WebElement element) {
        File screen = ((TakesScreenshot) driver).getScreenshotAs(OutputType.FILE);
        BufferedImage img;
        int width = element.getSize().getWidth();
        int height = element.getSize().getHeight();
        Point p = element.getLocation();
        try {
            img = ImageIO.read(screen);
            BufferedImage dest = img.getSubimage(p.getX(), p.getY(), width, height);
            ImageIO.write(dest, "png", screen);
        } catch (IOException e) {
            throw new UtilException(e);
        }
        return screen;
    }

}
