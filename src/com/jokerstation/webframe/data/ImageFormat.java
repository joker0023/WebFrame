package com.jokerstation.webframe.data;

import javax.imageio.ImageReader;

import com.jokerstation.webframe.exception.UnknowFormatException;
import com.sun.imageio.plugins.bmp.BMPImageReader;
import com.sun.imageio.plugins.gif.GIFImageReader;
import com.sun.imageio.plugins.jpeg.JPEGImageReader;
import com.sun.imageio.plugins.png.PNGImageReader;

/**
 * 图片格式枚举对象
 * @author Joker
 *
 */
public enum ImageFormat {

	jpg,gif,png,bmp;
    public static ImageFormat valueOfImageReader(ImageReader reader) throws UnknowFormatException {
        if (reader instanceof GIFImageReader) { 
            return ImageFormat.gif; 
        } else if (reader instanceof JPEGImageReader) { 
            return ImageFormat.jpg; 
        } else if (reader instanceof PNGImageReader) { 
            return ImageFormat.png; 
        } else if (reader instanceof BMPImageReader) { 
            return ImageFormat.bmp; 
        } else {
            throw new UnknowFormatException("未知的图片格式");
        }
    }
}
