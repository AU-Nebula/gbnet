# The image files lives in the images/ and come from two zip compressed
# archives, each around 10GB in size.
mkdir images

wget -nc -P images https://cs.stanford.edu/people/rak248/VG_100K_2/images.zip
unzip -d images images/images.zip
rm images/images.zip

wget -nc -P images https://cs.stanford.edu/people/rak248/VG_100K_2/images2.zip
unzip -d images images/images2.zip
rm images/images2.zip

# Move all the image files into the images/ folder at the project root.
find images/ -name \*.jpg -exec mv -t images/ {} +

# The annoated data used by GB-Net lives in the stanford/ folder.
mkdir stanford
wget -nc -P stanford http://svl.stanford.edu/projects/scene-graph/dataset/VG-SGG.h5
wget -nc -P stanford http://svl.stanford.edu/projects/scene-graph/dataset/VG-SGG-dicts.json
wget -nc -P stanford http://svl.stanford.edu/projects/scene-graph/VG/image_data.json

# The pre-trained Faster R-CNN model is downloaded and put in a specific folder
# according to the README.
mkdir -p checkpoints/vgdet
wget -nc -P checkpoints/vgdet https://www.dropbox.com/s/cfyqhskypu7tp0q/vg-24.tar
