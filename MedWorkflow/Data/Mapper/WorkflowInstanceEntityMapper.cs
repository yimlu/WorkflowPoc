﻿using System;
using System.Data;
using Dapper;
using MedWorkflow.Data.Entity;

namespace MedWorkflow.Data.Mapper
{
    public class WorkflowInstanceEntityMapper:AbstractMapper<WorkflowInstanceEntity,string>
    {
        public WorkflowInstanceEntityMapper(DbContext context)
            : base(context)
        {
        }

        /// <summary>
        /// 由主键获取记录
        /// </summary>
        /// <param name="key"></param>
        /// <returns></returns>
        public override WorkflowInstanceEntity SelectByPrimaryKey(string key)
        {
            using (var conn = DbFactory.GetConnection())
            {
                const string sql = @"SELECT * FROM MSC_WORKFLOW_INSTANCE T WHERE T.WORKFLOW_INSTANCE_ID = :InstanceId";
                return conn.QueryFirst<WorkflowInstanceEntity>(sql, new { InstanceId = key });
            }
        }

        public override int Insert(WorkflowInstanceEntity entity)
        {
            const string sql = @"INSERT INTO MSC_WORKFLOW_INSTANCE VALUES(
                                    :WORKFLOW_INSTANCE_ID,
                                    :WORKFLOW_TEMPLATE_ID,
                                    :FORM_TYPE,
                                    :FORM_ID,
                                    :OWNER_ID,
                                    :CREATED_ON,
                                    :LAST_UPDATED_ON,
                                    :INSTANCE_VERSION,
                                    :STATUS)";
            return Context.Connection.Execute(sql, entity,Context.Transaction);
        }

        /// <summary>
        /// 部分更新，仅允许更新状态
        /// </summary>
        /// <param name="entity"></param>
        public override int UpdateByPrimaryKeySelective(WorkflowInstanceEntity entity)
        {
            using (var conn = DbFactory.GetConnection())
            {
                const string sql = @"UPDATE MSC_WORKFLOW_INSTANCE SET STATUS=:STATUS WHERE WORKFLOW_INSTANCE_ID=:WORKFLOW_INSTANCE_ID";

                return conn.Execute(sql, entity);
            }
        }
    }
}