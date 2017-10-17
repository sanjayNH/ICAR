/* jshint indent: 1 */

module.exports = function(sequelize, DataTypes) {
	return sequelize.define('clntGrp', {
		clntKy: {
			type: DataTypes.INTEGER(11),
			allowNull: false,
			primaryKey: true,
			references: {
				model: 'CLNT',
				key: 'CLNT_KY'
			},
			field: 'CLNT_KY'
		},
		oprtnyKy: {
			type: DataTypes.INTEGER(11),
			allowNull: false,
			primaryKey: true,
			references: {
				model: 'OPRTNY',
				key: 'OPRTNY_KY'
			},
			field: 'OPRTNY_KY'
		},
		prmryIn: {
			type: DataTypes.CHAR(1),
			allowNull: false,
			field: 'PRMRY_IN'
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
		tableName: 'CLNT_GRP'
	});
};
