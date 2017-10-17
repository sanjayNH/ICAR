/* jshint indent: 1 */

module.exports = function(sequelize, DataTypes) {
	return sequelize.define('client', {
		clientKey: {
			type: DataTypes.INTEGER(11),
			allowNull: false,
			primaryKey: true,
			autoIncrement: true,
			field: 'CLNT_KY',
		
		},
		personHashId: {
			type: DataTypes.STRING(100),
			allowNull: false,
			field: 'PRSNL_HSH_ID'
		},
		prefix: {
			type: DataTypes.STRING(10),
			allowNull: true,
			field: 'PRFX_NM'
		},
		suffix: {
			type: DataTypes.STRING(10),
			allowNull: true,
			field: 'SFX_NM'
		},
		firstName: {
			type: DataTypes.STRING(30),
			allowNull: false,
			field: 'FRST_NM'
		},
		middleName: {
			type: DataTypes.STRING(30),
			allowNull: true,
			field: 'MIDL_NM'
		},
		lastName: {
			type: DataTypes.STRING(30),
			allowNull: false,
			field: 'LST_NM'
		},
		preferLanguageCode: {
			type: DataTypes.STRING(5),
			allowNull: false,
			references: {
				model: 'LNG_LKUP',
				key: 'LNG_CD'
			},
			field: 'PRFRD_LNG_CD'
		},
		preferPhoneTypeCode: {
			type: DataTypes.CHAR(1),
			allowNull: false,
			references: {
				model: 'PHN_TYP_LKUP',
				key: 'PHN_TYP_CD'
			},
			field: 'PRFRD_PHN_TYP_CD'
		},
		preferEmailTypeCode: {
			type: DataTypes.CHAR(1),
			allowNull: false,
			references: {
				model: 'EML_TYP_LKUP',
				key: 'EML_TYP_CD'
			},
			field: 'PRFRD_EML_TYP_CD'
		},
		companyName: {
			type: DataTypes.STRING(75),
			allowNull: true,
			field: 'CMPNY_NM'
		},
		createUserId: {
			type: DataTypes.STRING(60),
			allowNull: false,
			field: 'CRTE_USR_ID'
		},
		updateUserId: {
			type: DataTypes.STRING(60),
			allowNull: false,
			field: 'UPDT_USR_ID'
		},
		
	}, {
		tableName: 'CLNT',
		timestamps: true,	
		createdAt: 'CRTE_TS',
		updatedAt: 'UPDT_TS',
		deletedAt: false
	});
};
