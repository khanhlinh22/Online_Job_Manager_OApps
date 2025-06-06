export const uploadToCloudinary = async (fileUri, fileName, mimeType) => {
  const cloudName = 'dizsmwu7t';
  const uploadPreset = 'ojob_unsigned';

  const data = new FormData();
  data.append('file', {
    uri: fileUri,
    type: mimeType || 'image/jpeg',
    name: fileName || 'avatar.jpg',
  });
  data.append('upload_preset', uploadPreset);

  try {
    const res = await fetch(`https://api.cloudinary.com/v1_1/${cloudName}/auto/upload`, {
      method: 'POST',
      body: data,
    });

    const json = await res.json();

    if (json.secure_url) {
      return json.secure_url;
    } else {
      console.error('Upload error:', json);
      return null;
    }
  } catch (error) {
    console.error('Upload to Cloudinary failed:', error);
    return null;
  }
};
