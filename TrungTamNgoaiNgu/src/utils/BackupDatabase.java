package utils;

import java.io.File;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;

/**
 * @author huynh_000
 *
 */
public class BackupDatabase {
	public void backup() {
		Connection conn = ConnectionFactory.getConnection();

		try {
			Statement stm = conn.createStatement();
			File dir = new File("C:\\BackUp\\EnVn");
			if (!dir.exists()) {
				dir.setExecutable(true);
				dir.setReadable(true);
				dir.setWritable(true);

				if (dir.mkdirs()) {

				} else {
				}

			}

			String bakStr = "backup database TrungTamNgoaiNguENVN to disk = 'C:\\BackUp\\EnVn\\envn.bak' with init";
			stm.execute(bakStr);

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void restore() {
		Connection conn = ConnectionFactory.getConnection();

		try {
			Statement sm = conn.createStatement();
			String queryStr = "use master RESTORE DATABASE TrungTamNgoaiNguENVN FROM  DISK = 'C:\\BackUp\\EnVn\\envn.bak' WITH  REPLACE";
			sm.execute(queryStr);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * @return last backup time on database EnVn
	 */
	public String getLastBackup() {
		String lastModifed = "";
		File bak = new File("C:\\BackUp\\EnVn\\envn.bak");

		if (bak.exists()) {
			lastModifed = new SimpleDateFormat("MM/dd/yyyy HH:mm:ss")
					.format(bak.lastModified());
		} else {
			lastModifed = "Chưa tạo bản sao lưu";
		}

		return lastModifed;
	}

	public String getLastRestore() {
		String lastAccess = "";
		Connection conn = ConnectionFactory.getConnection();
		String queryStr = "select top 1 restore_date from msdb.dbo.restorehistory where destination_database_name = 'trungtamngoainguenvn' order by restore_date desc";
		Statement stm;

		try {
			stm = conn.createStatement();
			ResultSet result = stm.executeQuery(queryStr);

			if (result.next()) {
				lastAccess = result.getString("restore_date");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return lastAccess;
	}
}
