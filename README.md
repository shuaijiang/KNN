K近邻法（KNN）
===

Author：shuaijiang

Email： zhaoshuaijiang8@gmail.com

Homepage： [http://shuaijiang.github.io](http://shuaijiang.github.io "http://shuaijiang.github.io")

#算法思路：
如果一个样本在特征空间中的k个最相似(即特征空间中最邻近)的样本中的大多数属于某一个类别，则该样本也属于这个类别。

#k近邻法的三个基本要素：
1. k值的选择：k值的选择会对结果产生重大影响。较小的k值可以减少近似误差，但是会增加估计误差；较大的k值可以减小估计误差，但是会增加近似误差。一般而言，通常采用交叉验证法来选取最优的k值。
2. 距离度量：距离反映了特征空间中两个实例的相似程度。可以采用欧氏距离、曼哈顿距离等。
3. 分类决策规则：往往采用多数表决。