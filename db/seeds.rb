admin = User.new(username: "admin")
admin.password = "password"
admin.save!
puts "==========Created-Admin=========="

publications_list = ["The New York Times", "McSweeney's","Slate","Quartz","The Toast", "Fusion", "Above Average", "Vulture", "Medium", "Random Internet", "Comedic Poems / Collages"]
publications_list.each do |name|
  Publication.create!(name: name)
end
puts "==========Created-Publications=========="

article_list = [
    { title: "A trend story about millennials, by The New York Times", url: "http://fusion.net/story/283080/nyt-millennial-trend-story/", image_url: "http://i1.wp.com/fusion.net/wp-content/uploads/2016/03/GettyImages-492471314.jpg?resize=1440%2C810&quality=80&strip=all", featured: 1, publication_id: Publication.find_by(name: "Fusion").id},
    { title: "12 times I confused the Middle East for New Jersey, like Ben Carson did", url: "http://fusion.net/story/237919/you-say-tomato-i-say-new-jersey/", image_url: "http://41.media.tumblr.com/4dc6c3b1e187837c1921f9940e727546/tumblr_o0wa1krcWB1uxj9r4o1_400.jpg", featured: 1, publication_id: Publication.find_by(name: "Fusion").id },
    { title: "A poem constructed entirely from verbs used in John Oliver video headlines", url: "http://fusion.net/story/169586/a-poem-constructed-entirely-from-verbs-used-in-john-oliver-video-headlines/", image_url: "http://41.media.tumblr.com/f47170e178f5707706819b9494f195c1/tumblr_nsb97xlVhe1uxj9r4o1_500.jpg", featured: 1, publication_id: Publication.find_by(name: "Fusion").id },
    { title: "Here’s how this lion-killing dentist thing is going to play out", url: "http://fusion.net/story/174729/heres-how-this-lion-killing-dentist-thing-is-going-to-play-out/", image_url: "http://i0.wp.com/fusion.net/wp-content/uploads/2015/07/gettyimages-86176132.jpg?resize=1440%2C810&quality=80&strip=all", featured: 1, publication_id: Publication.find_by(name: "Fusion").id },
    { title: "Republican candidates for president order a burrito from Chipotle", url: "http://qz.com/383328/republican-candidates-for-president-order-a-burrito-from-chipotle/", image_url: "http://40.media.tumblr.com/95cf539ed27c2f94f71e0452edc11efd/tumblr_nr8b9zU1BC1uxj9r4o1_r2_500.jpg", featured: 1, publication_id: Publication.find_by(name: "Quartz").id},
    { title: "A Horror Story Constructed Entirely from Actual Sentences in Reviews of the Apple Watch", url: "https://www.yahoo.com/tech/a-horror-story-constructed-entirely-from-actual-115916627734.html", image_url: "https://www.yahoo.com/sy/ny/api/res/1.2/wHCZFIf22cDy0tL4xiv5Jg--/YXBwaWQ9aGlnaGxhbmRlcjtzbT0xO3c9ODAw/http://l.yimg.com/cd/resizer/2.0/original/NS0T7c3ZUXaH43vGOBXSZx-VSH0", featured: 1, publication_id: Publication.find_by(name: "Comedic Poems / Collages").id},
    { title: "EXCLUSIVE: The Secret Calls Leading Up to the Comcast–Time Warner Deal", url:"http://www.slate.com/blogs/moneybox/2014/02/13/comcast_time_warner_deal_transcript_of_the_secret_calls_leading_up_to_the.html", image_url: "http://36.media.tumblr.com/33391b1cdd71c8e194ab724ffff6e2d2/tumblr_npqze5jdLc1uxj9r4o1_r2_500.png", featured: 1, publication_id: Publication.find_by(name: "Slate").id},
    { title: "Orthodox Jewish Indie Music Acts", url: "http://the-toast.net/2013/12/06/orthodox-jewish-indie-music-acts/", image_url: "http://40.media.tumblr.com/e29f14d5da008f63ae9396de1f6756ec/tumblr_npr05rMMNf1uxj9r4o1_r1_500.jpg", featured: 1, publication_id: Publication.find_by(name: "The Toast").id},
    { title: "Silicon Valley Is the Anti-Entourage", url: "http://www.vulture.com/2015/06/silicon-valley-is-the-anti-entourage.html", image_url: "http://41.media.tumblr.com/ace9f7443d1de59ecfe040e2fcc7c667/tumblr_nplga9uW2T1uxj9r4o1_500.jpg", featured: 1, publication_id: Publication.find_by(name: "Vulture").id},
    { title: "A Poem Composed Entirely of SXSW Panel Titles", url: "https://www.yahoo.com/tech/a-poem-composed-entirely-of-sxsw-panel-titles-113788949904.html", image_url: "http://41.media.tumblr.com/c93c26b66897ef2eb261aca0ff177777/tumblr_nplgdoIz6M1uxj9r4o1_500.jpg", featured: 1, publication_id: Publication.find_by(name: "Comedic Poems / Collages").id},
    { title: "Ban Santacon", url: "http://www.nytimes.com/2013/12/13/opinion/ban-santacon.html", image_url: "http://41.media.tumblr.com/d19c7288a0600b86244a2acf1bb6bc69/tumblr_nplfyv8v9D1uxj9r4o1_500.jpg", featured: 1, publication_id: Publication.find_by(name: "The New York Times").id},
    { title: "Poem: There’s an Uber for X", url: "http://qz.com/311217/poem-theres-an-uber-for-x/", image_url: "http://36.media.tumblr.com/d45514dbf19f9d15a4b5f90553e15d70/tumblr_nplfofqbQQ1uxj9r4o1_r2_1280.jpg", featured: 1, publication_id: Publication.find_by(name: "Quartz").id},
    { title: "President Obama Announces Changes to the NSA.", url: "http://www.mcsweeneys.net/articles/president-obama-announces-changes-to-the-nsa", image_url: "http://36.media.tumblr.com/d958355569cc20b11b1108033c9d22f4/tumblr_nplfi6nmiL1uxj9r4o1_1280.jpg", featured: 1, publication_id: Publication.find_by(name: "Quartz").id}
]

article_list.each do |article_params|
  Article.create!(article_params)
end
puts "==========Created-Articles=========="