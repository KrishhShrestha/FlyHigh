package com.FlyHigh.util;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import jakarta.servlet.http.Part;

/**
 * Utility class for handling image file uploads.
 * <p>
 * This class provides methods for extracting the file name from a {@link Part}
 * object and uploading the image file to a specified directory on the server.
 * </p>
 */
public class ImageUtil {

	/**
	 * Extracts the file name from the given {@link Part} object based on the
	 * "content-disposition" header.
	 * 
	 * <p>
	 * This method parses the "content-disposition" header to retrieve the file name
	 * of the uploaded image. If the file name cannot be determined, a default name
	 * "download.png" is returned.
	 * </p>
	 * 
	 * @param part the {@link Part} object representing the uploaded file.
	 * @return the extracted file name. If no filename is found, returns a default
	 *         name "download.png".
	 */
	public static String getImageNameFromPart(Part part) {
		// Retrieve the content-disposition header from the part
		String contentDisp = part.getHeader("content-disposition");

		// Split the header by semicolons to isolate key-value pairs
		String[] items = contentDisp.split(";");

		// Initialize imageName variable to store the extracted file name
		String imageName = null;

		// Iterate through the items to find the filename
		for (String s : items) {
			if (s.trim().startsWith("filename")) {
				// Extract the file name from the header value
				imageName = s.substring(s.indexOf("=") + 2, s.length() - 1);
			}
		}

		// Check if the filename was not found or is empty
		if (imageName == null || imageName.isEmpty()) {
			// Assign a default file name if none was provided
			imageName = "download.png";
		}

		// Return the extracted or default file name
		return imageName;
	}


	/**
	 * Uploads the image file from the given {@link Part} object to a specified
	 * directory on the server.
	 * 
	 * <p>
	 * This method ensures that the directory where the file will be saved exists
	 * and creates it if necessary. It writes the uploaded file to the server's file
	 * system. Returns {@code true} if the upload is successful, and {@code false}
	 * otherwise.
	 * </p>
	 * 
	 * @param part the {@link Part} object representing the uploaded image file.
	 * @return {@code true} if the file was successfully uploaded, {@code false}
	 *         otherwise.
	 */
	public static boolean uploadImage(Part part, String ImageName, String rootPath, String saveFolder) {
		String savePath = getSavePath(saveFolder);
		File fileSaveDir = new File(savePath);

		// Ensure the directory exists
		if (!fileSaveDir.exists()) {
			if (!fileSaveDir.mkdir()) {
				return false; // Failed to create the directory
			}
		}
		try {
			// Create the file path
			String filePath = savePath + "/" + ImageName;
			// Write the file to the server
			part.write(filePath);
			return true; // Upload successful
		} catch (IOException e) {
			e.printStackTrace(); // Log the exception
			return false; // Upload failed
		}
	}
	
	/**
	 * Formats an image URL by appending a unique identifier to the filename.
	 * 
	 * <p>
	 * This helps prevent file name collisions by ensuring each uploaded image has
	 * a unique name.
	 * </p>
	 * 
	 * @param imageUrl the original image file name or URL.
	 * @return the formatted image name with a random 8-character UUID appended.
	 */
	public static String formatImageUrl(String imageUrl) {
		int dotIndex = imageUrl.lastIndexOf('.');
		if (dotIndex > 0) {
			String baseName = imageUrl.substring(0, dotIndex);
			String extension = imageUrl.substring(dotIndex);
			String uuid = UUID.randomUUID().toString().substring(0, 8);
			return baseName + "_" + uuid + extension;
		} else {
			// If no extension is present, just append the UUID
			return imageUrl + "_" + UUID.randomUUID().toString().substring(0, 8);
		}
	}
	

	/**
	 * Constructs the full path to the folder where uploaded images will be saved.
	 * 
	 * <p>
	 * This method uses a base path pointing to the FlyHigh project's `webapp` directory.
	 * </p>
	 * 
	 * @param saveFolder the folder name inside the webapp directory (e.g., "images").
	 * @return the absolute path to the folder where files should be saved.
	 */
	public static String getSavePath(String saveFolder) {
		String BaseUrl = "C:/Users/user/eclipse-workspace/";
		return BaseUrl + "FlyHigh/src/main/webapp/" + saveFolder + "/";
	}
}