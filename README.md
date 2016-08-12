#テーブル設計
***

##User
**association**
~~~
has_many :prototypes,:likes,:comments
~~~
**table**
-name
-email
-password
-member_of
-profile
-works
-image_url

##Prototype
**association**
~~~
has_many :likes,:comments,:captured_images
belongs_to :user
~~~
**table**
-title
-catchcopy
-concept
-user_id


##Like
**association**
~~~
belongs_to :user,:prototype,:comment
~~~
**table**
-user_id
-prototype_id

##Comment
**association**
~~~
belongs_to :user,:prototype
~~~
**table**
-content
-user_id
-prototype_id

##CapturedImage
**association**
~~~
belongs_to :prototype
~~~
**table**
-image_id
-image_url
-prototype_url
