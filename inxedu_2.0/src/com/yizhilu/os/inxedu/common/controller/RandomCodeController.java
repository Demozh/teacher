package com.yizhilu.os.inxedu.common.controller;

import com.yizhilu.os.inxedu.common.constants.CommonConstants;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Random;

/**
 * 生成验证图片Controller 
 */
@Controller
public class RandomCodeController {
	@RequestMapping({"/ran/random" })
	public void genericRandomCode(HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.setContentType("image/jpeg");
		response.setHeader("Pragma", "No-cache");
		response.setHeader("Cache-Control", "no-cache");
		response.setDateHeader("Expires", 0L);
		HttpSession session = request.getSession();

		int width = 85;
		int height = 28;
		BufferedImage image = new BufferedImage(width, height, 1);
		Graphics g = image.getGraphics();
		Random random = new Random();
		g.setColor(new Color(231, 231, 231));
		g.fillRect(0, 0, width, height);

		g.setFont(new Font("Microsoft YaHei", 2, 24));

		for (int i = 0; i < 155; i++) {
			int x = random.nextInt(width);
			int y = random.nextInt(height);
			int xl = random.nextInt(12);
			int yl = random.nextInt(12);
			g.drawLine(x, y, x + xl, y + yl);
		}

		String sRand = "";
		for (int i = 0; i < 4; i++) {
			String rand = String.valueOf(random.nextInt(10));
			sRand = sRand + rand;

			g.setColor(new Color(121, 143, 96));

			g.drawString(rand, 13 * i + 16, 23);
		}

		session.setAttribute(CommonConstants.RAND_CODE, sRand);

		g.dispose();

		ServletOutputStream responseOutputStream = response.getOutputStream();
		ImageIO.write(image, "JPEG", responseOutputStream);
		responseOutputStream.close();
	}

	Color getRandColor(int fc, int bc) {
		Random random = new Random();
		if (fc > 255)
			fc = 255;
		if (bc > 255)
			bc = 255;
		int r = fc + random.nextInt(bc - fc);
		int g = fc + random.nextInt(bc - fc);
		int b = fc + random.nextInt(bc - fc);
		return new Color(r, g, b);
	}
}