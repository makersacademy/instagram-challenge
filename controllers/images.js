const Image = require("../models/image");
// const dbConfig = require("../config/db");
const MongoClient = require("mongodb").MongoClient;
const GridFSBucket = require("mongodb").GridFSBucket;
// const url = dbConfig.url;
const baseUrl = "http://localhost:3030/files/";
// const mongoClient = new MongoClient(url);

const ImagesController = {
  Index: (req, res) => {
    Image
    .find( (err, images) => {
      if (err) {
        throw err;
      }
      
      images.forEach((image) => {
        image.postedAt = image.createdAt.toLocaleString();
      })

      res.render("images/index", { images: images,
          title: "Instagram",
          name: req.session.user.name,
          username: req.session.user.username
      });
    }).populate('user')
      .sort({createdAt: -1 }) 
      .exec(function(err, images) {
        if(err) throw err;
        images.forEach((image) => {
          console.log(image.user.name);
        })
      })
  },
  New: (req, res) => {
    res.render("images/new", {});
  },
  // Create: (req, res) => {
  //   req.body.user = req.session.user._id;
  //   req.body.posted_by = req.session.user.email;
  //   req.body.likes = 0;
  //   const image = new image(req.body);
  //   image.save((err) => {
  //     if (err) {
  //       throw err;
  //     }
  //     res.status(201).redirect("/images");
  //   });
  // },


  Create: async (req, res) => {
    console.log(req.file);
    try {
      await upload(req, res);
      console.log(req.file);
      if (req.file == undefined) {
        return res.send({
          message: "You must select a file.",
        });
      }
      return res.send({
        message: "File has been uploaded.",
      });
    } catch (error) {
      console.log(error);
      return res.send({
        message: "Error when trying upload image: ${error}",
      });
    }
  },

  Test: (req, res) => {
    res.send("Here")
  },
  Like: (req, res) => {
     
    Image
    .findOneAndUpdate(
      {_id: req.body.imageId}, {$inc:{likes: 1}}, {new: true},
      (err) => {
      if (err) {
        throw err;
      }
      //console.log(update);
      res.status(201).redirect("/images")
    });

  },

  // Download: async (req, res) => {
  //   try {
  //     await mongoClient.connect();
  //     const database = mongoClient.db(dbConfig.database);
  //     const bucket = new GridFSBucket(database, {
  //       bucketName: dbConfig.imgBucket,
  //     });
  //     let downloadStream = bucket.openDownloadStreamByName(req.params.name);
  //     downloadStream.on("data", function (data) {
  //       return res.status(200).write(data);
  //     });
  //     downloadStream.on("error", function (err) {
  //       return res.status(404).send({ message: "Cannot download the Image!" });
  //     });
  //     downloadStream.on("end", () => {
  //       return res.end();
  //     });
  //   } catch (error) {
  //     return res.status(500).send({
  //       message: error.message,
  //     });
  //   }
  // },

  // Get: async (req, res) => {
  //   try {
  //     await mongoClient.connect();
  //     const database = mongoClient.db(dbConfig.database);
  //     const images = database.collection(dbConfig.imgBucket + ".files");
  //     const cursor = images.find({});
  //     if ((await cursor.count()) === 0) {
  //       return res.status(500).send({
  //         message: "No files found!",
  //       });
  //     }
  //     let fileInfos = [];
  //     await cursor.forEach((doc) => {
  //       fileInfos.push({
  //         name: doc.filename,
  //         url: baseUrl + doc.filename,
  //       });
  //     });
  //     return res.status(200).send(fileInfos);
  //   } catch (error) {
  //     return res.status(500).send({
  //       message: error.message,
  //     });
  //   }
  // },

};

module.exports = ImagesController;
