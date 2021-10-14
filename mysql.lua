instance = {
	hostname = "127.0.0.1",
	username = "root",
	password = "",
	database = "dbname",
	port = 3306,

	db_conn = nil,

	db = function(self)
		self.db_conn = Connection("mysql","dbname="..self.database..";host="..self.hostname, self.username, self.password, "autoreconnect=1");
		if not self.db_conn then
			print('[SteelMTA] Veri tabanına bağlanılmadı.')
		else
			print('[SteelMTA] Veri tabanına bağlanıldı.')
		end
	end,
}
addEventHandler('onResourceStart', resourceRoot, function() instance:db() end)
function getConnection() return instance.db_conn end