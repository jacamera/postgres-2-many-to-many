INSERT INTO link (name, url)
VALUES
	('Google', 'https://www.google.com'),			-- 1
	('YouTube', 'https://www.youtube.com'),		-- 2
	('facebook', 'https://www.facebook.com'),		-- 3
	('Wikipedia', 'https://www.wikipedia.org'),	-- 4
	('Yahoo!', 'https://www.yahoo.com'),			-- 5
	('Amazon', 'https://www.amazon.com'),			-- 6
	('Twitter', 'https://www.twitter.com'),		-- 7
	('Instagram', 'https://www.instagram.com'),	-- 8
	('Live', 'https://www.live.com'),				-- 9
	('reddit', 'https://www.reddit.com');			-- 10
INSERT INTO tag (name)
VALUES
	('search'),		-- 1
	('video'),		-- 2
	('social'),		-- 3
	('reference'),	-- 4
	('shopping'),	-- 5
	('email'),		-- 6
	('news'),		-- 7
	('office');		-- 8
INSERT INTO link_tag (link_id, tag_id)
VALUES
	(1, 1), (1, 5), (1, 6), (1, 7), (1, 8),	-- Google: search, shopping, email, news, office
	(2, 2),												-- YouTube: video
	(3, 2), (3, 3), (3, 7),							-- facebook: video, social, news
	(4, 4),												-- Wikipedia: reference
	(5, 1), (5, 6), (5, 7),							-- Yahoo!: search, email, news
	(6, 2), (6, 5),									-- Amazon: video, shopping
	(7, 3),												-- Twitter: social
	(8, 3),												-- Instagram: social
	(9, 1), (9, 6), (9, 7),							-- Live: search, email, news
	(10, 3), (10, 7);									-- reddit: social, news