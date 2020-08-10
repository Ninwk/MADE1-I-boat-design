# MADE-I
独树一帜的MADE


#### **Abstract**：MADE project I (boat project) design report, this report aims at solving practical problems based on the learned advanced mathematics knowledge. It is necessary to determine the keel equation by calculating the waterline, restoring moment and stable vanishing angle, and then determine the shape of the ship model. First of all, it is necessary to measure and calculate the materials provided, list the corresponding mathematical relationship, calculate the corresponding parameters through MATLAB software, verify the performance of the ship to determine the length, width and height of the ship, and then determine the keel equation of the ship. Then we use SolidWorks software to draw the hull structure, then laser cut the wood plate first, then assemble, waterproof package and decoration of the hull, and finally launch the test. After continuous calculation and verification, the length, width and height of the ship are 30cm, 22cm and 17.5cm respectively, the waterline is 9.1190000001cm, and the stable disappearance angle is between 127°- 128 °. The report can be used as a practical reference for shipbuilding precautions.

**Key words**: center of gravity; Buoyancy; Vanishing Angle of stability;
Restoring moment



#### 摘要
MADE项目I（小船项目）设计报告，此次报告针对已学过的高等数学知识解决实际问题。需要通过计算吃水线，恢复力矩和稳定消失角等确定龙骨方程，进而确定船模形状。首先，需要对提供的材料测量计算，列出相应的数学关系式，通过matlab软件计算相应参数，验证船的性能以确定船的长宽高，再确定船的龙骨方程。接着用solidworks软件绘制船体结构，然后先激光切割木板。再拼装，船身防水包装和船身装饰，最后下水测试。经过不断计算和验证，船的长宽高分别为30cm，22cm，17.5cm，吃水线为9.1190000000001cm，稳定消失角在127°-128°之间。该报告可以对造船具有一定参考意义。 

关键字：重心;浮心;稳性消失角;复原力矩

#### 简介

当前，世界各大理工高校对学生的数理知识水平，越来越重视，为此，美国欧林工程学院开展了名字为QEA的项目，目的在于考验学生的数理逻辑思维、运算能力以及其他综合素质。然而，我国各大理工科高校对于将理论与实践结合起来的项目还比较少，学生大部分只会在纸上计算，而不能将实际的物体做出，并对比计算的结果与实际做出来的物体的差距。

为了真正做到实践与理论相结合，也为了提高我院学生的数理逻辑思维、动手能力以及其他综合素质，我们也设计了MADE
项目，并加以创新，命名MADE
I，需要学生从预估小船的方程，再到设计模型，组装，最后到下水测试。本篇文章的面向对象主要是那些对小船设计没有思路的新手，希望通读此篇论文，对于一艘小船设计的步骤有一定的了解。此次报告针对已学过的高等数学知识解决实际问题，用积分思想计算船的体积，质心，浮心，复原力矩，稳定消失角等重要参数，在入水后，能够0平稳漂浮，水面要刚好到达所计算的吃水线；在水中，当倾斜角小于145°，船体能够自行恢复到初始平衡位置，当倾斜角大于145°船体会翻转沉没在水中，同时要确定出具体倾斜角的数值大小。然后用matlab软件建立船体模型，计算质心，浮心位置，复原力矩的大小，以及稳定消失角大小，分析变量，找到适合的参数。在用solidworks软件建模，分析船的受力结构，结构的合理性以及在水里的稳定性等。

在这个过程中，首先最难确定的是船的长，宽，高。不同的数值，船的结构大相径庭，船的各种性能也会相差很大，其次，要用matlab软件编写程序，通过算法的迭代，求出船的吃水线，恢复力矩，稳定消失角等参数。为了得到最适合的方程，在这个过程中，总共替换了三个方程，才确定出最终的方程，于此同时也确定出了三个船模，很大程度上增加了项目难度系数；最后，船在考核之前不得下水测试，在整个过程中只能通过理论计算，这也为船的性能增添了很多不可控因素。虽然在整个过程中走了很多弯路，但这也为船成功下水打下了坚实的基础，最终我们的船完成了最终所有的测试项，并表现很优异。

