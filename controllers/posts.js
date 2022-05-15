const Photo = require("../models/post");
var fs = require('fs');
require('dotenv/config');
const multer = require('multer');
// const storage = multer.diskStorage({
//   destination: (req, file, cb) => {
//     cb(null, 'uploads')
//   },
//   filename: (req, file, cb) => {
//     cb(null, file.fieldname + '-' + Date.now())
//   }
// })
// const upload = multer({ storage: storage })

function middleware(req, res, next) {

  var imageName;

  var uploadStorage = multer.diskStorage({
    destination: function (req, file, cb) {
      cb(null, './uploads');
    },
    filename: function (req, file, cb) {
      imageName = file.originalname;
      //imageName += "_randomstring"
      cb(null, imageName);
    }
  });

  var upload = multer({ storage: uploadStorage });

  var uploadFile = upload.single('file');

  uploadFile(req, res, function (err) {
    req.imageName = imageName;
    req.uploadError = err;
    next();
  })
};

  const PostsController = {
    Index: (req, res) => {
      Photo.find((err, photos) => {
        if (err) {
          throw err;
        }
        else {
          res.render("posts/index", { photos: photos });
        }
      });
    },
    New: (req, res) => {
      res.render("posts/new", {});
    },
    Create: (req, res) => {
      middleware
      const photo = new Photo(req.body)
      photo.save((err) => {
        if (err) {
          throw err;
        }
        res.redirect('/posts')
      })
    }
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

