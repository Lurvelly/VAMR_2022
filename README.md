## Fall 2022 - Vision Algorithms for Mobile Robotics

This is practicing for the "Vision Algorithms for Mobile Robotics" at ETH Zurich ([Website](https://rpg.ifi.uzh.ch/teaching.html))

If there are any questions, feel free to open an issue in this github repository.

### Course Program, Slides, and Additional Reading Material

---

Please notice that this is a tentative schedule and that the effective content of the lecture may change from week to week.

| Date                 | Lecture and Exercise description                                                                                                                                                                                                          | Slides, exercises, and additional reading material                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    |
| -------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **22.09.2022** | **Lecture 01 - Introduction to Computer Vision and Visual Odometry<br />No Exercise today.**                                                                                                                                        | [Lecture Slides](https://rpg.ifi.uzh.ch/docs/teaching/2022/01_introduction.pdf) <br />[Additional reading on Visual Odometry](https://rpg.ifi.uzh.ch/docs/teaching/2022/VO_tutorials.zip) <br />[Linear Algebra Primer from Stanford University](http://vision.stanford.edu/teaching/cs131_fall1617/lectures/lecture2_linalg_review_cs131_2016.pdf)<br />[Linear Algebra interactive tool](http://immersivemath.com/ila/index.html) <br />[Camera notation tutorial](http://paulfurgale.info/news/2014/6/9/representing-robot-pose-the-good-the-bad-and-the-ugly)                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    |
| **29.09.2022** | **Lecture 02 - Image Formation: perspective projection and camera models<br />Exercise 01- Augmented reality wireframe cube**                                                                                                       | [Lecture Slides](https://rpg.ifi.uzh.ch/docs/teaching/2022/02_image_formation.pdf) <br />[Matlab primer](https://rpg.ifi.uzh.ch/docs/teaching/2022/MatlabPrimer.pdf) <br />[Matlab primer code](https://rpg.ifi.uzh.ch/docs/teaching/2022/matlab_primer_code.zip) <br />[Python Tutorial](https://docs.python.org/3/tutorial/) <br />[Exercise 01](https://rpg.ifi.uzh.ch/docs/teaching/2022/exercise1.zip)<br />[Solutions 01 (Matlab/Python/Numerical)](https://rpg.ifi.uzh.ch/docs/teaching/2022/exercise1_solution.zip)                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             |
| **06.10.2022** | **Lecture 03 - Camera Calibration<br />Exercise 02 - PnP problem**                                                                                                                                                                  | [Lecture Slides](https://rpg.ifi.uzh.ch/docs/teaching/2022/03_camera_calibration.pdf) (updated 13.10.2022, see changes [here](https://rpg.ifi.uzh.ch/docs/teaching/2022/03_changes.txt)) <br />[Additional reading on P3P and PnP problems](https://rpg.ifi.uzh.ch/docs/teaching/2022/pnp_papers.zip) <br />[Exercise 02](https://rpg.ifi.uzh.ch/docs/teaching/2022/exercise2.zip) <br />[Solutions 02 (Matlab/Python/Numerical)](https://rpg.ifi.uzh.ch/docs/teaching/2022/exercise2_solution.zip)                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  |
| **13.10.2022** | **Lecture 03 continued <br />Lecture 04 - Filtering & Edge detection<br />Exercise session replaced by continuation of Lecture 4.**                                                                                                 | [Lecture Slides](https://rpg.ifi.uzh.ch/docs/teaching/2022/04_filtering.pdf) <br />[Numerical Exercise Lecture 04](https://rpg.ifi.uzh.ch/docs/teaching/2022/lecture04_numerical_exercise.pdf)<br />[Numerical Exercise Lecture 04 Solution](https://rpg.ifi.uzh.ch/docs/teaching/2022/lecture04_numerical_exercise_solution.pdf)                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
| **20.10.2022** | **Lecture 05 - Point Feature Detectors, Part 1<br />Exercise 03 - Harris detector + descriptor + matching**                                                                                                                         | [Lecture Slides](https://rpg.ifi.uzh.ch/docs/teaching/2022/05_feature_detection_1.pdf) <br />[Exercise 03](https://rpg.ifi.uzh.ch/docs/teaching/2022/exercise3.zip)<br />[Solutions 03 (Matlab/Python/Numerical)](https://rpg.ifi.uzh.ch/docs/teaching/2022/exercise3_solution.zip)                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            |
| **27.10.2022** | **Lecture 06 - Point Feature Detectors, Part 2<br />Exercise 04 - SIFT detector + descriptor + matching**                                                                                                                           | [Lecture Slides](https://rpg.ifi.uzh.ch/docs/teaching/2022/06_feature_detection_2.pdf)<br />[Additional reading on feature detection](https://rpg.ifi.uzh.ch/docs/teaching/2022/feature_detectors.zip)<br />[Exercise 04](https://rpg.ifi.uzh.ch/docs/teaching/2022/exercise4.zip)<br />[Solutions 04 (Matlab/Python/Numerical)](https://rpg.ifi.uzh.ch/docs/teaching/2022/exercise4_solution.zip)                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                |
| **03.11.2022** | **Lecture 07 - Multiple-view geometry 1<br />Exercise 05 - Stereo vision: rectification, epipolar matching, disparity, triangulation**                                                                                              | [Lecture Slides](https://rpg.ifi.uzh.ch/docs/teaching/2022/07_multiple_view_geometry_1.pdf) <br />[Additional reading on stereo image rectification](https://rpg.ifi.uzh.ch/docs/teaching/2022/rectification.zip)<br />[Exercise 05](https://rpg.ifi.uzh.ch/docs/teaching/2022/exercise5.zip)<br />[Solutions 05](https://rpg.ifi.uzh.ch/docs/teaching/2022/exercise5_solution.zip)                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               |
| **10.11.2022** | **Lecture 08 - Multiple-view geometry 2<br />Exercise 06 - Eight-Point Algorithm**                                                                                                                                                  | [Lecture Slides](https://rpg.ifi.uzh.ch/docs/teaching/2022/08_multiple_view_geometry_2.pdf) (updated 17.11.2022, see changes [here](https://rpg.ifi.uzh.ch/docs/teaching/2022/08_changes.txt))<br />[Additional reading on 2-view geometry](https://rpg.ifi.uzh.ch/docs/teaching/2022/2-view_geometry.zip)<br />[Exercise 06](https://rpg.ifi.uzh.ch/docs/teaching/2022/exercise6.zip)<br />[Solutions 06](https://rpg.ifi.uzh.ch/docs/teaching/2022/exercise6_solution.zip)                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         |
| **17.11.2022** | **Lecture 09 - Multiple-view geometry 3<br />Exercise 07 - P3P algorithm and RANSAC**                                                                                                                                               | [Lecture Slides](https://rpg.ifi.uzh.ch/docs/teaching/2022/09_multiple_view_geometry_3.pdf) <br />[Additional reading on RANSAC](https://rpg.ifi.uzh.ch/docs/teaching/2022/ransac.zip)<br />[Exercise 07](https://rpg.ifi.uzh.ch/docs/teaching/2022/exercise7.zip)<br />[Solutions 07](https://rpg.ifi.uzh.ch/docs/teaching/2022/exercise7_solution.zip)                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          |
| **24.11.2022** | **Lecture 10 - Multiple-view geometry 4<br />Continuation of Lecture 10 + Exercise session on Intermediate VO Integration**                                                                                                         | [Lecture Slides](https://rpg.ifi.uzh.ch/docs/teaching/2022/10_multiple_view_geometry_4.pdf) <br />[Additional reading on open-source VO algorithms](https://rpg.ifi.uzh.ch/docs/teaching/2022/open-source-VO_papers.zip)<br />[Numerical Exercise Lecture 10](https://rpg.ifi.uzh.ch/docs/teaching/2022/lecture10_numerical_exercise.pdf)<br />[Numerical Exercise Lecture 10 Solution](https://rpg.ifi.uzh.ch/docs/teaching/2022/lecture10_numerical_exercise_solution.pdf)                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      |
| **01.12.2022** | **Lecture 11 <br />``1st hour: seminar by Dr. Jeff Delaune from NASA-JPL: "Vision-Based Navigation for Mars Helicopters"``<br />``2nd hour: Optical Flow and KLT Tracking``<br />Exercise 08 - Lucas-Kanade tracker**               | [Lecture Slides](https://rpg.ifi.uzh.ch/docs/teaching/2022/11_tracking.pdf) <br />[Additional reading on KLT](https://rpg.ifi.uzh.ch/docs/teaching/2022/lucaskanade.zip)<br />[Exercise 08](https://rpg.ifi.uzh.ch/docs/teaching/2022/exercise8.zip)<br />[Solutions 08](https://rpg.ifi.uzh.ch/docs/teaching/2022/exercise8_solution.zip)                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        |
| **08.12.2022** | **Lecture 12a (1st hour) - Place recognition<br />Lecture 12b (2nd hour) - Dense 3D Reconstruction <br />Lecture 12c (3rd and 4th hour, replaces exercise)** <br />``Deep Learning Tutorial Optional Exercise on Place Recogntion`` | [Lecture Slides on Place Recognition](https://rpg.ifi.uzh.ch/docs/teaching/2022/12a_recognition.pdf) <br />[Lecture Slides on Dense 3D Reconstruction](https://rpg.ifi.uzh.ch/docs/teaching/2022/12b_dense_reconstruction.pdf) (updated 08.12.2022, see changes [here](https://rpg.ifi.uzh.ch/docs/teaching/2022/12b_changes.txt))<br />[Lecture Slides on Deep Learning](https://rpg.ifi.uzh.ch/docs/teaching/2022/12c_deep_learning.pdf) <br />[Optional Exercise on Place Recogntion](https://rpg.ifi.uzh.ch/docs/teaching/2022/optional_exercise_place_recognition.zip)<br />[Numerical Exercise Lecture 12](https://rpg.ifi.uzh.ch/docs/teaching/2022/lecture12_numerical_exercise.pdf) <br />[Numerical Exercise Lecture 12 Solution](https://rpg.ifi.uzh.ch/docs/teaching/2022/lecture12_numerical_exercise_solution.pdf)<br />[Additional reading on dense 3D reconstruction](https://rpg.ifi.uzh.ch/docs/teaching/2022/dense_reconstruction.zip)[Additional reading on Bag-of-Words-based place recognition](https://rpg.ifi.uzh.ch/docs/teaching/2022/recognition.zip) |
| **15.12.2022** | **Lecture 13 - Visual inertial fusion<br />Exercise 09 - Bundle Adjustment**                                                                                                                                                        | [Lecture Slides](https://rpg.ifi.uzh.ch/docs/teaching/2022/13_visual_inertial_fusion.pdf) (updated 16.12.2022, see changes [here](https://rpg.ifi.uzh.ch/docs/teaching/2022/13_changes.txt))<br />[Additional reading on VIO](https://rpg.ifi.uzh.ch/docs/teaching/2022/extra_reading_VIO.zip)<br />[Exercise 09](https://rpg.ifi.uzh.ch/docs/teaching/2022/exercise9.zip)[Solutions 09](https://rpg.ifi.uzh.ch/docs/teaching/2022/exercise9_solution.zip)                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           |
| **22.12.2022** | **Lecture 14 - Event based vision<br />Exercise session: Final VO Integration**                                                                                                                                                     | [Lecture Slides](https://rpg.ifi.uzh.ch/docs/teaching/2022/14_event_based_vision.pdf)<br />[Additional reading on event-based vision](https://rpg.ifi.uzh.ch/docs/teaching/2022/extra_reading_DVS.zip)                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      |
| **12.01.2023** | **Written exam: from 08:00 to 10:00 am. More details will be given during the semester.**                                                                                                                                           |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       |

### Optional Mini Project and Grading

---

Students taking the final exam have the opportunity to submit a mini project to increase their final grade. Notice that the  **mini project is optional** , that is, not mandatory. Depending on the result of the mini project, the student will be rewarded with a grade increase of up to 0.5 on the top of the grade of the written exam. However, bear in mind that the mini project can be quite time consuming. Students, who want to submit a mini project, should work in a group of  **minimum 2 and max 4 persons** . The deadline for the mini-project is  **Sunday, 08.01.2023, 23:59:59** , and it can be submitted via e-mail to the assistants. Mini project specifications and files can be found in the table below.

| Description                    | Link (size)                                                                                                                 |
| ------------------------------ | --------------------------------------------------------------------------------------------------------------------------- |
| Project Specification          | [vo_project_statement.pdf](https://rpg.ifi.uzh.ch/docs/teaching/2022/vo_project_statement.pdf)                                 |
| FAQ                            | [Frequently Asked Questions](https://docs.google.com/document/d/1IuWmXyO1m5DV77AhEa-MpK-yp9LDMQO5IM6oyVLvHa0/edit?usp=sharing) |
| Parking garage dataset (easy)  | [parking.zip](https://rpg.ifi.uzh.ch/docs/teaching/2022/parking.zip) (208.3 MB)                                                |
| KITTI 05 dataset (hard)        | [kitti05.zip](https://rpg.ifi.uzh.ch/docs/teaching/2022/kitti05.zip) (1.4 GB)                                                  |
| Malaga 07 dataset (hard)       | [malaga-urban-dataset-extract-07.zip](https://rpg.ifi.uzh.ch/docs/teaching/2022/malaga-urban-dataset-extract-07.zip) (2.4 GB)  |
| Matlab script to load datasets | [main.m](https://rpg.ifi.uzh.ch/docs/teaching/2022/main.m)                                                                     |

---

### Recommended Textbooks

(All available in the [Swisscovery catalogue](https://swisscovery.slsp.ch/discovery/search?vid=41SLSP_NETWORK:VU1_UNION&lang=en))---

Unfortunately, a single textbook that covers all the material seen in class does not exist yet. However, the topics covered in class can be found in the books listed below. At the end of each lecture's slide deck, you will find a list of chapters and books where the topics can be found.

* **Computer Vision: Algorithms and Applications** , by Richard Szeliski, Springer, 2nd Edition, 2021. The PDF of the book can be freely downloaded from the [author&#39;s webpage](http://szeliski.org/Book/). Although the author is working on a 2nd edition, this is still under progress. Thus, in the lecture nodes we will reference chapters of the 1st edition.
* **Chapter 4 of "Autonomous Mobile Robots"** , by R. Siegwart, I.R. Nourbakhsh, D. Scaramuzza. [PDF](https://rpg.ifi.uzh.ch/docs/teaching/2021/Ch4_AMRobots.pdf)
* **Robotics, Vision and Control: Fundamental Algorithms, 2nd Ed.** , by Peter Corke 2017. The PDF of the book can be freely downloaded (only with ETH VPN) from the [author&#39;s webpage](http://www.springer.com/us/book/9783319544120#otherversion=9783319544137).
* **An Invitation to 3D Vision** , by Y. Ma, S. Soatto, J. Kosecka, S.S. Sastry.
* **Multiple view Geometry** , by R. Hartley and A. Zisserman.

---

### Spring 2007-2015 - Autonomous Mobile Robots

---

From 2007 to 2015 I was co-lecturer of the course Autonomous Mobile Robots together with Prof. Roland Siegwart. The old Power Point slides and videos can be found [here](https://secure-web.cisco.com/1ltHEHu0em07bdoDORPTAjFGeBz9QcOMnTvyQmZZWX5csOn8OAgBQln5mnb5-HTgzGH79fMpbUNPxG0CGryUWTYOzBFW33oED8h5FW3Ax5d9WGIImm5HewXFOM3a3TnrIUgpngC9N4kN_SY6D1MbWaD3Y6VMQjRsn6HWlRleydpAbW-enzgvCqAGHeXnklOpkgGI1LgBHYDfi9KZfjb0RMQheHFbDwsjNBo1ZHXa-5Jwv3boiumat5NxUjQ4aXvvxIfMDsEpszXsSU3HVMTOnM-AHNffelM8o7xA8hYwf-Dygg0wt_0EJyo1ua0FCjsuVyisYBXWSINn1wmq66-xrhJIdqtHuSVeTpRKvNnGK3K1yp4spjSM95UQYbLI4Lx_z5inJARc6UVh6SD9UQhckJLfPZ2xkQHBzVbd3Tg4AGk0yYCbjtGh32MyEc4uRKTrB/https%3A%2F%2Fwww.dropbox.com%2Fsh%2Fqnnndyb8keguvdn%2FAAD53PAE9Co_wBzbnGRdtYRua%3Fdl%3D0). The lectures of the course inspired the second edition of the omonym book Autonomous Mobile Robots below.

The course continues to be taught by Prof. Siegwart at the [following link](https://asl.ethz.ch/education/lectures/autonomous_mobile_robots.html).

The course is also available as an MOOC (Massive Open Online Course) on the popular online platform [edX](https://www.edx.org/course/autonomous-mobile-robots).
