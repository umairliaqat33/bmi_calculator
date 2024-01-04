# projects

A new Flutter project.

## Getting Started

I cloned this project after a long time, it had an old version of flutter.
What i did to solve this problem is given below in steps:
1. First i ran "flutter pub get" and this got all the dependencies regardless of being updated.
2. Then i ran flutter pub outdated to check which dependencies are outdated.
3. Third step was to upgrade those outdated dependencies so i used "flutter pub upgrade" command for upgrading dependencies.
4. Next step was to run project and check what goes wrong, so i ran project and got errors of it compileSDKVersion and minSDKVersion not being in sync. So i changed the compileSDKVersion to 31 in app/build.gradle file.
5. After this we got some more error of java which i solved by replacing:
    ext.kotlin_version = '1.3.50' with     ext.kotlin_version = '1.9.22'
    classpath 'com.android.tools.build:gradle:4.1.0' with    classpath 'com.android.tools.build:gradle:7.0.4'
in android/build.gradle file

After following these steps upgradation of flutter project was complete and it was ready to run.

Now i was suppossed to make changes in code to make it work and look better and if there is something missing adding it as well.

6. First thing i did was to change the name of first widget from BMICalculator to MyApp. Because it is basic knowledge to have the name of first widget class to MyApp.
7. Then i began to understand the execution of project and found one thing which was not suppossed to be there was Enums. So i created a folder with name Utils and then created a file enums.dart and added this enum in this file. 
8. Then i saw that the app was overflowing from screen which and going to out top bar which displays time and battery signal. So i wrapped the whole Scaffold with SafeArea which prevents this kind of behavior.



3. In next step i ran this command "./gradlew wrapper --gradle-version=7.6.1" to upgrade its gradle version.
4. Next step was to update compileSdkVersion in app level gradle file, i changed it to 31.
5. Then i had to update the     ext.kotlin_version  which i changed to '1.9.22' after checking on kotlin's website "https://kotlinlang.org/docs/releases.html#release-details".

After all these steps my project was good to go.

6. Removed the debug tag.
7. Converted MyApp from statelfull to stateless.
8. added media query sizes.
9. Removed commented Code.
10. Made code resueable.
11. Separated UI from functionality.
12. Removed differences from all button where they were same.
13. Changed colors of operation buttons.
14. Changed colors of all numeric buttons to differentiate between them.
15. Made equal button look bigger.
16. Solved button's distance and sizes issues by giving them a min width and height.
17. Expression and result text widgets were not looking good. They had some disturbed sizes and locations gave them size and set their location to right bottom.
18. Expression text did not had a place holder, added 0 as a place holder.
19. Separated clear and delete functions
