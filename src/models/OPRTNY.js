/* jshint indent: 1 */

module.exports = function(sequelize, DataTypes) {
	return sequelize.define('oprtny', {
		oprtnyKy: {
			type: DataTypes.INTEGER(11),
			allowNull: false,
			primaryKey: true,
			field: 'OPRTNY_KY'
		},
		clntKy: {
			type: DataTypes.INTEGER(11),
			allowNull: false,
			references: {
				model: 'CLNT_GRP',
				key: 'CLNT_KY'
			},
			field: 'CLNT_KY'
		},
		chnlCd: {
			type: DataTypes.CHAR(2),
			allowNull: false,
			field: 'CHNL_CD'
		},
		dlrshpKy: {
			type: DataTypes.INTEGER(11),
			allowNull: false,
			references: {
				model: 'DLRSHP',
				key: 'DLRSHP_KY'
			},
			field: 'DLRSHP_KY'
		},
		oprtnyDt: {
			type: DataTypes.DATE,
			allowNull: false,
			unique: true,
			field: 'OPRTNY_DT'
		},
		crntOprtnyActvtyKy: {
			type: DataTypes.INTEGER(11),
			allowNull: false,
			field: 'CRNT_OPRTNY_ACTVTY_KY'
		},
		dlvryCmpltDt: {
			type: DataTypes.DATE,
			allowNull: true,
			field: 'DLVRY_CMPLT_DT'
		},
		dlvryVhclIdNb: {
			type: DataTypes.CHAR(17),
			allowNull: true,
			field: 'DLVRY_VHCL_ID_NB'
		},
		dlvryNewUsdIn: {
			type: DataTypes.CHAR(1),
			allowNull: true,
			field: 'DLVRY_NEW_USD_IN'
		},
		dlvryEmlId: {
			type: DataTypes.STRING(120),
			allowNull: true,
			field: 'DLVRY_EML_ID'
		},
		prvcyAprvlIn: {
			type: DataTypes.CHAR(1),
			allowNull: false,
			field: 'PRVCY_APRVL_IN'
		},
		prvcyAprvlNm: {
			type: DataTypes.STRING(75),
			allowNull: true,
			field: 'PRVCY_APRVL_NM'
		},
		prvcyAprvlPhnNb: {
			type: DataTypes.STRING(50),
			allowNull: true,
			field: 'PRVCY_APRVL_PHN_NB'
		},
		crteUsrId: {
			type: DataTypes.STRING(60),
			allowNull: false,
			field: 'CRTE_USR_ID'
		},
		crteTs: {
			type: DataTypes.DATE,
			allowNull: false,
			defaultValue: sequelize.literal('CURRENT_TIMESTAMP'),
			field: 'CRTE_TS'
		},
		updtUsrId: {
			type: DataTypes.STRING(60),
			allowNull: false,
			field: 'UPDT_USR_ID'
		},
		updtTs: {
			type: DataTypes.DATE,
			allowNull: false,
			defaultValue: sequelize.literal('CURRENT_TIMESTAMP'),
			field: 'UPDT_TS'
		}
	}, {
		tableName: 'OPRTNY'
	});
};
