﻿using System.Collections.Generic;

namespace MedWorkflow
{
    /// <summary>
    /// 工作流引擎
    /// </summary>
    public interface IWorkflowEngine
    {
        /// <summary>
        /// 流程状态更新事件
        /// </summary>
        event WorkflowStateChangedEventHandler OnWorkflowStateChanged;

        IWorkflowSession NewSession();

        void RegisterUserCredentialsProvider(IUserCredentialsProvider sessionProvider);

        void Initialize();

        IEnumerable<IWorkflowTemplate> AvailableWorkflowTemplates { get; }

        IWorkflowTemplate LoadWorkflowTemplate(string workflowTemplateId);

        IUserCredentialsProvider RegisteredUserCredentialsProviderProvider { get; }
    }
}