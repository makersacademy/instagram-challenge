const Photo = require("../models/post");
const fs = require('fs');
require('dotenv/config');
const multer = require('multer');
const path = require('path');
const {GridFsStorage} = require('multer-gridfs-storage');
const Grid = require('gridfs-stream');
const crypto = require('crypto');
const mongoose = require('mongoose');

// const storage = multer.diskStorage({
//   destination: (req, file, cb) => {
//     cb(null, 'uploads')
//   },
//   filename: (req, file, cb) => {
//     cb(null, file.fieldname + '-' + Date.now())
//   }
// })
// const upload = multer({ storage: storage })

// function middleware(req, res, next) {

//   var imageName;

//   var uploadStorage = multer.diskStorage({
//     destination: function (req, file, cb) {
//       cb(null, './new');
//     },
//     filename: function (req, file, cb) {
//       imageName = file.originalname;
//       //imageName += "_randomstring"
//       cb(null, imageName);
//     }
//   });

//   var upload = multer({ storage: uploadStorage });

//   var uploadFile = upload.single('file');

//   uploadFile(req, res, function (err) {
//     req.imageName = imageName;
//     req.uploadError = err;
//     next();
//   })
// };
  
// const storage = multer.diskStorage({
//     destination: (req, file, cb) => {
//         cb(null, 'uploads')
//     },
//     filename: (req, file, cb) => {
//         cb(null, file.fieldname + '-' + Date.now())
//     }
// });
const conn = mongoose.createConnection("mongodb://0.0.0.0/jordangram");

let gfs;

conn.once('open', () => {
  // Init stream
  gfs = Grid(conn.db, mongoose.mongo);
  gfs.collection('photos');
});

const storage = new GridFsStorage({
  url: "mongodb://0.0.0.0/jordangram",
  file: (req, file) => {
    return new Promise((resolve, reject) => {
      crypto.randomBytes(16, (err, buf) => {
        if (err) {
          return reject(err);
        }
        const filename = buf.toString('hex') + path.extname(file.originalname);
        const fileInfo = {
          filename: filename,
          bucketName: 'uploads'
        };
        resolve(fileInfo);
      });
    })
  }
});

const upload = multer({ storage: storage });

const PostsController = {
  Index: (req, res) => {
    gfs.files.find().toArray((err, files) => {
      // Check if files
      if (!files || files.length === 0) {
        res.render('posts/index', { files: false });
      } else {
        files.map(file => {
          if (
            file.contentType === 'image/jpeg' ||
            file.contentType === 'image/png'
          ) {
            file.isImage = true;
          } else {
            file.isImage = false;
          }
        });
        res.render('posts/index', { files: files });
      }
    });
  },
  //   Photo.find({}, (err, photos) => {
  //     if (err) {
  //       throw err;
  //     }
  //     else {
  //       res.render("posts/index", { photos: photos });
  //     }
  //   });
  // },
  New: (req, res) => {
    res.render("posts/new", {});
  },
    
    
  Create: (upload.single('file'), (req, res) => {
    res.json({file: req.file})
    // res.redirect('/posts')
    // const obj = {
    //   name: req.body.name,
    //   caption: req.body.caption,
    //   img: {
    //     data: fs.readFileSync(path.join(__dirname + '/uploads/' + req.body.name)),
    //     contentType: 'image/png'
    //   }
    // }
    // Photo.create(obj, (err, item) => {
    //   if (err) {
    //     console.log(err);
    //   }
    //   else {
    //     item.save();
    //     res.redirect('/posts');
    //   }
    // });
  }),
  UpdateLikes: (req, res) => {
    console.log("Update likes in controller");
    console.log(req.params.id);
    const action = req.body.action;
    const counter = (action === "Like" ? 1 : -1);
    Photo.updateOne(
      { _id: req.params.id },
      { $inc: { likes: counter } },
      {},
      (err, number) => {
        if (err) {
          throw err;
        }
        res.send(number);
      }
    );
  },
}
    
module.exports = PostsController;

  //     // const tempPath = req.file.path;
  //     // const targetPath = path.join(__dirname, "./uploads/image.png");
      
  //     // if (path.extname(req.file.originalname).toLowerCase() === ".png") {
  //     //   fs.rename(tempPath, targetPath, err => {
  //     //     if (err) {
  //     //       throw err;
  //     //     } else {
  //           const obj = {
  //             name: req.body.name,
  //             caption: req.body.caption,
  //             img: {
  //               data: fs.readFileSync(path.join(__dirname + '/uploads/' + req.file.filename)),
  //               contentType: 'image/png'
  //             }
  //           }
  //           Photo.create(obj, (err, item) => {
  //             if (err) {
  //               throw err;
  //             }
  //             else {
  //               item.save((err) => {
  //                 if (err) {
  //                   throw err;
  //                 }
  //               })
  //               res
  //                 .status(200)
  //                 .contentType("text/plain")
  //                 .end("File uploaded!")
  //                 .redirect('/posts');
  //             }
  //           })
  //         })
  //       }
  //     }
        
      // } else {
      //   fs.unlink(tempPath, err => {
      //     if (err) return handleError(err, res);

      //     res
      //       .status(403)
      //       .contentType("text/plain")
      //       .end("Only .png files are allowed!");
      //   })
      // }
    // })


//     var obj = {
//       name: req.body.name,
//       caption: req.body.caption,
//       img: {
//         data: fs.readFileSync(path.join(__dirname + '/uploads/' + req.file.filename)),
//         contentType: 'image/png'
//       }
//     }
//     Photo.create(obj, (err, item) => {
//       if (err) {
//         throw err;
//       }
//       else {
//         item.save((err) => {
//           if (err) {
//             throw err;
//           }
//         })
//         res.redirect('/posts');
//       }
//     })
//   })
//     })
//   }
// };

